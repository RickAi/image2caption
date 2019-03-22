import tensorflow as tf

graph_def_file = "./merged_frozen_graph.pb"
input_arrays = ["encoder/import/input"]
output_arrays = ["decoder/LSTM/word_0", "decoder/LSTM/word_1", "decoder/LSTM/word_2", "decoder/LSTM/word_3",
                 "decoder/LSTM/word_4", "decoder/LSTM/word_5", "decoder/LSTM/word_6", "decoder/LSTM/word_7",
                 "decoder/LSTM/word_8", "decoder/LSTM/word_9", "decoder/LSTM/word_10", "decoder/LSTM/word_11",
                 "decoder/LSTM/word_12", "decoder/LSTM/word_13", "decoder/LSTM/word_14", "decoder/LSTM/word_15",
                 "decoder/LSTM/word_16", "decoder/LSTM/word_17", "decoder/LSTM/word_18", "decoder/LSTM/word_19",
                 "decoder/LSTM/word_20", "decoder/LSTM/word_21"]

input_shapes = {"encoder/import/input": [1, 224, 224, 3]}
converter = tf.contrib.lite.TFLiteConverter.from_frozen_graph(
    graph_def_file, input_arrays, output_arrays, input_shapes)
tflite_model = converter.convert()
open("merged_frozen_graph.tflite", "wb").write(tflite_model)
