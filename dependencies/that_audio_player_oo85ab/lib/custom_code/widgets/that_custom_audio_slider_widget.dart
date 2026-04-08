// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../widgets/that_audio_player.dart';

class ThatCustomAudioSliderWidget extends StatefulWidget {
  const ThatCustomAudioSliderWidget({
    super.key,
    this.width,
    this.height,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.overlayColor,
  });

  final double? width;
  final double? height;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? thumbColor;
  final Color? overlayColor;

  @override
  _ThatCustomAudioSliderWidgetState createState() =>
      _ThatCustomAudioSliderWidgetState();
}

class _ThatCustomAudioSliderWidgetState
    extends State<ThatCustomAudioSliderWidget> {
  final ThatAudioPlayerState _audioPlayer = ThatAudioPlayerState();
  double _sliderValue = 0.0;
  double _duration = 1.0;

  @override
  void initState() {
    super.initState();
    _duration = _audioPlayer.getTotalDurationOfAudio().toDouble();
    _sliderValue = _audioPlayer.getCurrentPositionOfAudio().toDouble();

    FFAppState().addListener(_updateSlider);
  }

  @override
  void dispose() {
    FFAppState().removeListener(_updateSlider);
    super.dispose();
  }

  void _updateSlider() {
    setState(() {
      _sliderValue = FFAppState().currentPositionOfAudioInSeconds;
      _duration = FFAppState().totalDurationOfAudioInSeconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor:
            widget.activeTrackColor ?? FlutterFlowTheme.of(context).primary,
        inactiveTrackColor:
            widget.inactiveTrackColor ?? FlutterFlowTheme.of(context).accent4,
        thumbColor: widget.thumbColor ?? FlutterFlowTheme.of(context).primary,
        overlayColor: widget.overlayColor ??
            FlutterFlowTheme.of(context).accent1.withOpacity(0.2),
      ),
      child: Slider(
        min: 0,
        max: _duration > 0 ? _duration : 1,
        value: _sliderValue.clamp(0, _duration),
        onChanged: (value) {
          setState(() => _sliderValue = value);
        },
        onChangeEnd: (value) {
          _audioPlayer.seek(value: value);
        },
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
