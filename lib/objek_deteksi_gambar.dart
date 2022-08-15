import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite_image_classification/bounding_box.dart';
import 'package:tflite_image_classification/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

const String ssd = " SSD MobileNet";

class ObjectDetection extends StatefulWidget {
  final List<CameraDescription> cameras;

  const ObjectDetection(this.cameras, {Key? key}) : super(key: key);
  @override
  _ObjectDetectionState createState() => _ObjectDetectionState();
}

class _ObjectDetectionState extends State<ObjectDetection> {
  List<dynamic> _recognitions = [];
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  loadModel() async {
    String? result;

    switch (_model) {
      case ssd:
        result = (await Tflite.loadModel(
            labels: "assets/tflite/ssd_mobilenet.txt",
            model: "assets/tflite/ssd_mobilenet.tflite"));
    }

    // ignore: avoid_print
    print(result);
  }

  onSelectModel(model) {
    setState(() {
      _model = model;
    });

    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: _model == ""
          ? Container()
          : Stack(
              children: [
                Camera(widget.cameras, _model, setRecognitions),
                BoundingBox(
                    // ignore: prefer_if_null_operators, unnecessary_null_comparison
                    _recognitions == null ? [] : _recognitions,
                    math.max(_imageHeight, _imageWidth),
                    math.min(_imageHeight, _imageWidth),
                    screen.width,
                    screen.height,
                    _model),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onSelectModel(ssd);
        },
        child: const Icon(Icons.photo_camera),
      ),
    );
  }
}
