

gdown https://drive.google.com/uc?id=0ByhzM2YklhADNmk4cEN2MTA5U0E
mv merged_frozen_graph.pb ../android/Application/src/main/assets/merged_frozen_graph.pb

wget -c https://deepdetect.com/models/tf/inception_v4.pb
mv inception_v4.pb ../tensorflow/ConvNets

wget -c http://shannon.cs.illinois.edu/DenotationGraph/data/flickr30k-images.tar
tar -zxvf flickr30k-images.tar ../tensorflow/Dataset/flickr30k-images

wget -c http://shannon.cs.illinois.edu/DenotationGraph/data/flickr30k.tar.gz
tar -zxvf flickr30k.tar.gz ./
mv ./flickr30k/results_20130124.token ../tensorflow/Dataset/flickr30k-images
rm -rf ./flickr30k

python convfeatures.py --data_path ../tensorflow/Dataset/flickr30k-images --inception_path ../tensorflow/ConvNets/inception_v4.pb

# python main.py --mode train --caption_path ./Dataset/results_20130124.token --feature_path ./Dataset/features.npy --resume
