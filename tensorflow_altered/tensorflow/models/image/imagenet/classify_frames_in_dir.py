import os
from subprocess import call
count = 0
for file in [f for f in os.listdir('.') if os.path.isfile(f)]:
    if (count % 6 == 0) and '.jpg' in file:
    # print(os.getcwd() + '/' + file)
        command = 'python /Users/dsiah/Documents/SeniorProject/tensorflow/tensorflow/models/image/imagenet/classify_image.py'
        flags = ' --image_file ./{} > frame_{}.txt &&'.format(file, file.replace('.jpg', ''))
        print(command + flags)
    count += 1
