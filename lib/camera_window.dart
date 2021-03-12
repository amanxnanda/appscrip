import 'package:appscrip/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraWindow extends StatefulWidget {
  final double xPos;
  final double yPos;
  CameraWindow({Key? key, required this.xPos, required this.yPos})
      : super(key: key);

  @override
  _CameraWindowState createState() => _CameraWindowState();
}

class _CameraWindowState extends State<CameraWindow> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  double xPosition = 0;
  double yPosition = 0;

  @override
  void initState() {
    xPosition = widget.xPos;
    yPosition = widget.yPos;
    _controller = CameraController(
      cameras.last,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: yPosition,
      left: xPosition,
      child: GestureDetector(
        onPanUpdate: (tapInfo) {
          setState(() {
            xPosition += tapInfo.delta.dx;
            yPosition += tapInfo.delta.dy;
          });
        },
        child: SizedBox(
          height: 150,
          width: 150,
          child: FutureBuilder(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                print(snapshot.error);
                return CameraPreview(_controller);
              } else {
                return Center(child: CircularProgressIndicator());
              }
              // return CameraPreview(_controller);
            },
          ),
        ),
      ),
    );
  }
}
