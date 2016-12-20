# :egg: Closed Captioning for Cooking Videos

Artificial Neural networks are a hotbed of research activity, especially in the area of Computer Vision. In this project, work was done into various ways to approach captioning domain specific videos.  Cooking videos from top-down or isometric perspectives  were analyzed by sending them down a multi-stage pipeline in order to extract details for improving current captioning systems implemented on sites like Youtube and Vimeo
This project sought to combine existing techniques such as Optical Character Recognition, Object Recognition Neural Networks, and Sequence to Sequence learning to extract information from cooking videos in order to produce better captions. The work of this project shows promise for the use of weaker existing programs in order to create domain specific expertise without the need for more training, in order to harness the combined power of existing technologies.
## Contents

1. Layout & Description
2. FFMPEG splitting
3. Text Extraction Gallery
4. Image Caption Gallery
5. Accuracy example
6. S2VT outline and example

## Layout & Description
The following readme acts as a guide to the work that was produced during this semester's senior project. I have included the various files that I tailored in order to preprocess videos for the purpose of improving subtitles. The project is organized into the several stages of processesing with a brief explanation of the work and examples in each section. This repository also contains a sample video that was processed and the various pieces of information that were produced.
<img src="https://dl.dropboxusercontent.com/u/45750707/Pipeline.png" alt="Pipeline photo" />

## FFMPEG splitting

FFMPEG was used in this project to split the videos into indivual frames that were used in the proceeding sections. The [one-liner.py file](https://github.com/dsiah/SeniorProject/blob/master/misc/one-liners.py) includes various bash commands that I used to split the videos.

The results are in the [frames folder](https://github.com/dsiah/SeniorProject/tree/master/ButternutSquashBake/images_256) (downscaled images of 256x256 dimension) and the [betterframes folder](https://github.com/dsiah/SeniorProject/tree/master/ButternutSquashBake/betterframes) (original aspect ratio images)

## Text Extraction Gallery
<img src="https://dl.dropboxusercontent.com/u/45750707/StagesMatlab.png" alt="Matlab Stages"/>

In this stage images were processed through [this matlab script](https://github.com/dsiah/SeniorProject/blob/master/TextDetectionStatic.m) to identify and isolate all overlayed text in all of the images (must be run in the same folder as the pictures). Output was stored


## Image Caption Gallery

The Image Caption gallery shows approximately first 60 frames of video chosen for object recognition labels via tensorflow.
The two files altered in order to run batch jobs and create these captions are located in: [this repository](https://github.com/dsiah/SeniorProject/tree/master/tensorflow_altered/tensorflow/models/image/imagenet)

The code to generate this table (in it's entirety is here)
```python
path = "https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/"

for i in xrange(6, 870, 6):
  print("<img src=\"{}out{:04d}.jpg\" height=\"256\" width=\"256\"> | [Caption_{:04d}]({}frame_out{:04d}.txt)".format(path, i, i, path, i))
```

| Image | Caption File Link |
| ----- | ----------------- |
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0006.jpg" height="256" width="256"> | [Caption_0006](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0006.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0012.jpg" height="256" width="256"> | [Caption_0012](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0012.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0018.jpg" height="256" width="256"> | [Caption_0018](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0018.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0024.jpg" height="256" width="256"> | [Caption_0024](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0024.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0030.jpg" height="256" width="256"> | [Caption_0030](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0030.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0036.jpg" height="256" width="256"> | [Caption_0036](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0036.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0042.jpg" height="256" width="256"> | [Caption_0042](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0042.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0048.jpg" height="256" width="256"> | [Caption_0048](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0048.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0054.jpg" height="256" width="256"> | [Caption_0054](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0054.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0060.jpg" height="256" width="256"> | [Caption_0060](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0060.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0066.jpg" height="256" width="256"> | [Caption_0066](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0066.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0072.jpg" height="256" width="256"> | [Caption_0072](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0072.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0078.jpg" height="256" width="256"> | [Caption_0078](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0078.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0084.jpg" height="256" width="256"> | [Caption_0084](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0084.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0090.jpg" height="256" width="256"> | [Caption_0090](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0090.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0096.jpg" height="256" width="256"> | [Caption_0096](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0096.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0102.jpg" height="256" width="256"> | [Caption_0102](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0102.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0108.jpg" height="256" width="256"> | [Caption_0108](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0108.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0114.jpg" height="256" width="256"> | [Caption_0114](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0114.txt)
<img src="https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/out0120.jpg" height="256" width="256"> | [Caption_0120](https://raw.githubusercontent.com/dsiah/SeniorProject/master/ButternutSquashBake/betterframes/frame_out0120.txt)

## Accuracy example
Accuracy nouns were extracted using two programs. The first is given a youtube video Id and the produced output is the description from the video. From the output that is piped to nltkTagger and the nouns are extracted from the video description.

```bash
node fetcher.js azydqgAwBE8 | python nltkTagger.py
```

## S2VT outline and example
The captions for this video were generated in the steps outlined in [one-liner.py file](https://github.com/dsiah/SeniorProject/blob/master/misc/one-liners.py). The produced subtitles were produced for 16 frames at a time and the produced captions are in [this text file](https://github.com/dsiah/SeniorProject/blob/master/ButternutSquashBake/Captions.txt)

## Credits

Numerous projects were combined in this project they are outlined in the papers and code bases below:

- Venugopalan, Subhashini and Rohrbach, Marcus and Donahue, Jeff and Mooney, Raymond and Darrell, Trevor and Saenko, Kate "Sequence to Sequence -- Video to Text". Proceedings of the IEEE International Conference on Computer Vision (ICCV), 2015.

- FFmpeg (http://www.ffmpeg.org)

- Chen, Huizhong, et al. "Robust Text Detection in Natural Images with Edge-Enhanced Maximally Stable Extremal Regions." Image Processing (ICIP), 2011 18th IEEE International Conference on. IEEE, 2011.

- Gonzalez, Alvaro, et al. "Text location in complex images." Pattern Recognition (ICPR), 2012 21st International Conference on. IEEE, 2012.
Li, Yao, and Huchuan Lu. "Scene text detection via stroke width." Pattern Recognition (ICPR), 2012 21st International Conference on. IEEE, 2012.
Neumann, Lukas, and Jiri Matas. "Real-time scene text localization and recognition." Computer Vision and Pattern Recognition (CVPR), 2012 IEEE Conference on. IEEE, 2012.

- Martín Abadi, Ashish Agarwal, Paul Barham, Eugene Brevdo, Zhifeng Chen, Craig Citro, Greg S. Corrado, Andy Davis, Jeffrey Dean, Matthieu Devin, Sanjay Ghemawat, Ian Goodfellow, Andrew Harp, Geoffrey Irving, Michael Isard, Rafal Jozefowicz, Yangqing Jia,
Lukasz Kaiser, Manjunath Kudlur, Josh Levenberg, Dan Mané, Mike Schuster, Rajat Monga, Sherry Moore, Derek Murray, Chris Olah, Jonathon Shlens, Benoit Steiner, Ilya Sutskever, Kunal Talwar, Paul Tucker, Vincent Vanhoucke, Vijay Vasudevan, Fernanda Viégas,Oriol Vinyals, Pete Warden, Martin Wattenberg, Martin Wicke, Yuan Yu, and Xiaoqiang Zheng. TensorFlow: Large-scale machine learning on heterogeneous systems, 2015. Software available from tensorflow.org. 
