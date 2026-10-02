// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import '/app_events/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:camera/camera.dart';

class CustomCameraWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final int cameraIndex;

  const CustomCameraWidget({
    Key? key,
    this.width,
    this.height,
    this.backgroundColor,
    this.cameraIndex = 0,
  }) : super(key: key);

  @override
  State<CustomCameraWidget> createState() => _CustomCameraWidgetState();
}

class _CustomCameraWidgetState extends State<CustomCameraWidget> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;
  int _currentCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentCameraIndex = widget.cameraIndex;
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    if (_cameras!.isEmpty) {
      debugPrint('No cameras found');
      return;
    }

    _controller = CameraController(
      _cameras![_currentCameraIndex],
      ResolutionPreset.medium,
    );

    await _controller!.initialize();
    if (!mounted) return;
    setState(() {
      _isInitialized = true;
    });
  }

  Future<void> switchCamera() async {
    if (_cameras == null || _cameras!.length < 2) return;

    _currentCameraIndex = (_currentCameraIndex + 1) % _cameras!.length;

    await _controller?.dispose();

    _controller = CameraController(
      _cameras![_currentCameraIndex],
      ResolutionPreset.medium,
    );

    await _controller!.initialize();
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.backgroundColor ?? Colors.black,
      child: _isInitialized && _controller != null
          ? CameraPreview(_controller!)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
