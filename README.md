## image2caption

![](demo/result.jpg)

The live demo video is available at the [demo.mp4](demo/demo.mp4)

## Pre-Trained

* If you don't want to train CNN model from scratch, you can download the MobileNetV2 pre-trained model is at: [TensorFlow MobileNetV2](https://github.com/tensorflow/models/tree/master/research/slim/nets/mobilenet); You will need to train the RNN model with the commands in Training step.
* If you don't want to train the whole model, you can download the pre-trained model at: [Pre-Trained Models](https://drive.google.com/open?id=1csIAmgP32Ml1ppg3C-9Upn_VCz3O3Ds8), and put it into android project fold, and build the apk.
* If you even don't want to build the apk, you can download the pre-built apk at: [Pre-Built Apk](https://drive.google.com/open?id=1w1m2TufWpS1BeAGei5_5F9eEjQEXNLPS)

## Traning

![](demo/train.jpg)

```bash
python main.py --mode train --caption_path ./Dataset/captions_train2014.json --feature_path ./Dataset/features.npy --data_is_coco
```

## Inference

![](demo/inference.jpg)

```bash
python main.py --mode test --inception_path ConvNets/mobilenet_v2.pb --image_path Images/library.jpg 
```

## Generate Model

If the model have been trained, a convenient shell file is available at [generate.sh](tensorflow/generate.sh)

```bash
python main.py --mode test --image_path ./Images/street.jpg --inception_path ./ConvNets/mobilenet_v2.pb --saveencoder --savedecoder

cd utils
python save_graph.py --mode encoder --model_folder ../model/Encoder/
python save_graph.py --mode decoder --model_folder ../model/Decoder/

# generate .pb
# for now, pb is enough for inference
python merge_graphs.py --encpb ../model/Trained_Graphs/encoder_frozen_model.pb --decpb ../model/Trained_Graphs/decoder_frozen_model.pb

cd model/Trained_Graphs/
# generate .tflite
# there are some ops not support in the latest tflite library
tflite_convert \
  --output_file=./merged_frozen_graph.tflite \
  --graph_def_file=./merged_frozen_graph.pb \
  --input_arrays=encoder/import/input \
  --input_shapes=1,224,224,3 \
  --output_arrays=decoder/LSTM/word_0,decoder/LSTM/word_1,decoder/LSTM/word_2,decoder/LSTM/word_3,decoder/LSTM/word_4,decoder/LSTM/word_5,decoder/LSTM/word_6,decoder/LSTM/word_7,decoder/LSTM/word_8,decoder/LSTM/word_9,decoder/LSTM/word_10,decoder/LSTM/word_11,decoder/LSTM/word_12,decoder/LSTM/word_13,decoder/LSTM/word_14,decoder/LSTM/word_15,decoder/LSTM/word_16,decoder/LSTM/word_17,decoder/LSTM/word_18,decoder/LSTM/word_19,decoder/LSTM/word_20,decoder/LSTM/word_21
```

## References

* [neural-nuts/image-caption-generator](https://github.com/neural-nuts/image-caption-generator)
* [Cam2Caption](https://github.com/neural-nuts/Cam2Caption)
