python main.py --mode test --image_path ./Images/street.jpg --inception_path ./ConvNets/mobilenet_v2.pb --saveencoder --savedecoder

echo "save encoder/decoder done"

cd utils
python save_graph.py --mode encoder --model_folder ../model/Encoder/
python save_graph.py --mode decoder --model_folder ../model/Decoder/

echo "freeze encoder/decoder done"

# generate .pb
python merge_graphs.py --encpb ../model/Trained_Graphs/encoder_frozen_model.pb --decpb ../model/Trained_Graphs/decoder_frozen_model.pb

echo "generate pb done"