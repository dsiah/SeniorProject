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
