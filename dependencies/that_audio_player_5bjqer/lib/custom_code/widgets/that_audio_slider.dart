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

import './that_audio_player.dart';

class ThatAudioSlider extends StatefulWidget {
  ThatAudioSlider({required this.height, required this.width});

  final double height;
  final double width;

  @override
  _ThatAudioSliderState createState() => _ThatAudioSliderState();
}

class _ThatAudioSliderState extends State<ThatAudioSlider> {
  final audioState = ThatAudioPlayerState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackShape:
              const RectangularSliderTrackShape(), // Ensures full-width track
          trackHeight: 3.0, // Slimmer progress bar
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: Slider(
          min: 0,
          max: audioState.getTotalDurationOfAudio().toDouble(),
          value: audioState
              .getCurrentPositionOfAudio()
              .toDouble()
              .clamp(0, audioState.getTotalDurationOfAudio().toDouble()),
          onChanged: (value) {
            audioState.seek(value: value);
          },
          activeColor: FlutterFlowTheme.of(context).primary,
          inactiveColor: FlutterFlowTheme.of(context).alternate,
        ),
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
