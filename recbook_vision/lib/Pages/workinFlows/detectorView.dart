import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';

import 'cameraView.dart';

enum DetectorViewMode { liveFeed, gallery }

class DetectorView extends StatefulWidget {
  DetectorView({
    Key? key,
    required this.title,
    required this.onImage,
    this.customPaint,
    this.text,
    this.initialDetectionMode = DetectorViewMode.liveFeed,
    this.initialCameraLensDirection = CameraLensDirection.back,
    this.onCameraFeedReady,
    this.onDetectorViewModeChanged,
    this.onCameraLensDirectionChanged,
  }) : super(key: key);

  final String title;
  final CustomPaint? customPaint;
  final String? text;
  final DetectorViewMode initialDetectionMode;
  final Function(InputImage inputImage) onImage;
  final Function()? onCameraFeedReady;
  final Function(DetectorViewMode mode)? onDetectorViewModeChanged;
  final Function(CameraLensDirection direction)? onCameraLensDirectionChanged;
  final CameraLensDirection initialCameraLensDirection;

  @override
  State<DetectorView> createState() => _DetectorViewState();
}

class _DetectorViewState extends State<DetectorView> {
  late DetectorViewMode _mode;
  late String distanceStatus;

  @override
  void initState() {
    _mode = widget.initialDetectionMode;
    distanceStatus = "Too Near";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CameraView(
            customPaint: widget.customPaint,
            onImage: widget.onImage,
            onCameraFeedReady: widget.onCameraFeedReady,
            onDetectorViewModeChanged: _onDetectorViewModeChanged,
            initialCameraLensDirection: widget.initialCameraLensDirection,
            onCameraLensDirectionChanged: widget.onCameraLensDirectionChanged,
          ),
        ),
        Positioned(
          top: 25,
          left: 0,
          right: 0,
          child: _distanceWidget(),
        ),
        _takePictureButton(), // Added the takePictureButton
      ],
    );
  }

  Widget _distanceWidget() {
    String message;
    Color textColor;
    Gradient gradient;

    switch (distanceStatus) {
      case "Too far":
        message = "Too far";
        break;
      case "Face not Found":
        message = "Face not Found";
        break;
      case "Too Near":
        message = "Too Near";
        break;
      case "Alright Perfect":
        message = "Alright Perfect";
        break;
      default:
        message = "Unknown Status";
    }

    return Container(
      padding: EdgeInsets.all(26.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.6),
            Colors.black.withOpacity(0.6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Text(
        message,
        style: TextStyle(fontSize: 32, fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  void _onDetectorViewModeChanged() {
    _mode = DetectorViewMode.liveFeed;
    if (widget.onDetectorViewModeChanged != null) {
      widget.onDetectorViewModeChanged!(_mode);
    }
    setState(() {});
  }

  Widget _takePictureButton() => Positioned(
        bottom: 8,
        child: SizedBox(
          height: 50.0,
          width: 50.0,
          child: FloatingActionButton(
            heroTag: Object(),
            onPressed: () {
              // _controller?.takePicture().then((XFile file) => print(file.path));
            },
            backgroundColor: Colors.black,
            child: Icon(
              Icons.camera_alt,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      );
}
