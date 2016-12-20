# ffmpeg -i _file_ -vf fps=5,scale=256:256 _file_%04d.jpg 

#1. ffmpeg -vf scale=256:256 frame=5 ../Honeycomb\ Toffee-Vr7Q6izUnxo.mp4 
#2. generate image paths using shell script in vgg folder
#3. extract_features.py (takes a long time so fix this)
#4. Edit file paths and replace with vid2_frame_[imagename and rest of line] -> testfeatures.txt
#5. move the txt file into the s2vt folder and run with python s2vt_captioner.py -m s2vt_vgg_rgb

split -l 16 -d image_path_list.txt
