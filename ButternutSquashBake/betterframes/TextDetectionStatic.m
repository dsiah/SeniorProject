%% Automatically Detect and Recognize Text in Natural Images
% This example shows how to detect regions in an image that contain text.
% This is a common task performed on unstructured scenes. Unstructured
% scenes are images that contain undetermined or random scenarios. For
% example, you can detect and recognize text automatically from captured
% video to alert a driver about a road sign. This is different than
% structured scenes, which contain known scenarios where the position of
% text is known beforehand.
%
% Segmenting text from an unstructured scene greatly helps with additional
% tasks such as optical character recognition (OCR). The automated text
% detection algorithm in this example detects a large number of text region
% candidates and progressively removes those less likely to contain text.
%
% Copyright 2015 The MathWorks, Inc.


files = dir('*.jpg');
for file = files'
    file.name
    %% Step 1: Detect Candidate Text Regions Using MSER
    colorImage = imread(file.name);
    I = rgb2gray(colorImage);

    [mserRegions] = detectMSERFeatures(I, ... 
        'RegionAreaRange',[200 8000],'ThresholdDelta',4);


    %% Step 2: Remove Non-Text Regions Based On Basic Geometric Properties

    sz = size(I);
    pixelIdxList = cellfun(@(xy)sub2ind(sz, xy(:,2), xy(:,1)), ...
        mserRegions.PixelList, 'UniformOutput', false);

    % Next, pack the data into a connected component struct.
    mserConnComp.Connectivity = 8;
    mserConnComp.ImageSize = sz;
    mserConnComp.NumObjects = mserRegions.Count;
    mserConnComp.PixelIdxList = pixelIdxList;

    % Use regionprops to measure MSER properties
    mserStats = regionprops(mserConnComp, 'BoundingBox', 'Eccentricity', ...
        'Solidity', 'Extent', 'Euler', 'Image');

    % Compute the aspect ratio using bounding box data.
    bbox = vertcat(mserStats.BoundingBox);
    w = bbox(:,3);
    h = bbox(:,4);
    aspectRatio = w./h;

    % Threshold the data to determine which regions to remove. These thresholds
    % may need to be tuned for other images.
    filterIdx = aspectRatio' > 3; 
    filterIdx = filterIdx | [mserStats.Eccentricity] > .995 ;
    filterIdx = filterIdx | [mserStats.Solidity] < .3;
    filterIdx = filterIdx | [mserStats.Extent] < 0.2 | [mserStats.Extent] > 0.9;
    filterIdx = filterIdx | [mserStats.EulerNumber] < -4;

    % Remove regions
    mserStats(filterIdx) = [];
    mserRegions(filterIdx) = [];

    %% Step 3: Remove Non-Text Regions Based On Stroke Width Variation

    % Get a binary image of the a region, and pad it to avoid boundary effects
    % during the stroke width computation.
    regionImage = mserStats(6).Image;
    regionImage = padarray(regionImage, [1 1]);

    % Compute the stroke width image.
    distanceImage = bwdist(~regionImage); 
    skeletonImage = bwmorph(regionImage, 'thin', inf);

    strokeWidthImage = distanceImage;
    strokeWidthImage(~skeletonImage) = 0;

    % Compute the stroke width variation metric 
    strokeWidthValues = distanceImage(skeletonImage);   
    strokeWidthMetric = std(strokeWidthValues)/mean(strokeWidthValues);

    %%
    % Then, a threshold can be applied to remove the non-text regions. Note
    % that this threshold value may require tuning for images with different
    % font styles.

    % Threshold the stroke width variation metric
    strokeWidthThreshold = 0.4;
    strokeWidthFilterIdx = strokeWidthMetric > strokeWidthThreshold; 

    %%
    % The procedure shown above must be applied separately to each detected
    % MSER region. The following for-loop processes all the regions, and then
    % shows the results of removing the non-text regions using stroke width
    % variation.

    % Process the remaining regions
    for j = 1:numel(mserStats)

        regionImage = mserStats(j).Image;
        regionImage = padarray(regionImage, [1 1], 0);

        distanceImage = bwdist(~regionImage);
        skeletonImage = bwmorph(regionImage, 'thin', inf);

        strokeWidthValues = distanceImage(skeletonImage);

        strokeWidthMetric = std(strokeWidthValues)/mean(strokeWidthValues);

        strokeWidthFilterIdx(j) = strokeWidthMetric > strokeWidthThreshold;

    end

    % Remove regions based on the stroke width variation
    mserRegions(strokeWidthFilterIdx) = [];
    mserStats(strokeWidthFilterIdx) = [];


    %% Step 4: Merge Text Regions For Final Detection Result
   
    % Get bounding boxes for all the regions
    bboxes = vertcat(mserStats.BoundingBox);

    % Convert from the [x y width height] bounding box format to the [xmin ymin
    % xmax ymax] format for convenience.
    xmin = bboxes(:,1);
    ymin = bboxes(:,2);
    xmax = xmin + bboxes(:,3) - 1;
    ymax = ymin + bboxes(:,4) - 1;

    % Expand the bounding boxes by a small amount.
    expansionAmount = 0.02;
    xmin = (1-expansionAmount) * xmin;
    ymin = (1-expansionAmount) * ymin;
    xmax = (1+expansionAmount) * xmax;
    ymax = (1+expansionAmount) * ymax;

    % Clip the bounding boxes to be within the image bounds
    xmin = max(xmin, 1);
    ymin = max(ymin, 1);
    xmax = min(xmax, size(I,2));
    ymax = min(ymax, size(I,1));

    % Show the expanded bounding boxes
    expandedBBoxes = [xmin ymin xmax-xmin+1 ymax-ymin+1];
    IExpandedBBoxes = insertShape(colorImage,'Rectangle',expandedBBoxes,'LineWidth',3);

    % Compute the overlap ratio
    overlapRatio = bboxOverlapRatio(expandedBBoxes, expandedBBoxes);

    % Set the overlap ratio between a bounding box and itself to zero to
    % simplify the graph representation.
    n = size(overlapRatio,1); 
    overlapRatio(1:n+1:n^2) = 0;

    % Create the graph
    g = graph(overlapRatio);

    % Find the connected text regions within the graph
    componentIndices = conncomp(g);

    % Merge the boxes based on the minimum and maximum dimensions.
    xmin = accumarray(componentIndices', xmin, [], @min);
    ymin = accumarray(componentIndices', ymin, [], @min);
    xmax = accumarray(componentIndices', xmax, [], @max);
    ymax = accumarray(componentIndices', ymax, [], @max);

    % Compose the merged bounding boxes using the [x y width height] format.
    textBBoxes = [xmin ymin xmax-xmin+1 ymax-ymin+1];

    % Remove bounding boxes that only contain one text region
    numRegionsInGroup = histcounts(componentIndices);
    textBBoxes(numRegionsInGroup == 1, :) = [];

    % Show the final text detection result.
    ITextRegion = insertShape(colorImage, 'Rectangle', textBBoxes,'LineWidth',3);

    %% Step 5: Recognize Detected Text Using OCR

    ocrtxt = ocr(I, textBBoxes);
    [ocrtxt.Text]


    %% References
    %
    % [1] Chen, Huizhong, et al. "Robust Text Detection in Natural Images with
    %     Edge-Enhanced Maximally Stable Extremal Regions." Image Processing
    %     (ICIP), 2011 18th IEEE International Conference on. IEEE, 2011.
    %
    % [2] Gonzalez, Alvaro, et al. "Text location in complex images." Pattern
    %     Recognition (ICPR), 2012 21st International Conference on. IEEE,
    %     2012.
    %
    % [3] Li, Yao, and Huchuan Lu. "Scene text detection via stroke width."
    %     Pattern Recognition (ICPR), 2012 21st International Conference on.
    %     IEEE, 2012.
    %
    % [4] Neumann, Lukas, and Jiri Matas. "Real-time scene text localization
    %     and recognition." Computer Vision and Pattern Recognition (CVPR),
    %     2012 IEEE Conference on. IEEE, 2012.

    % displayEndOfDemoMessage(mfilename)

end
