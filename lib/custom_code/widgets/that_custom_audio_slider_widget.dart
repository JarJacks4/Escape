// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
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
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/enums/enums.dart"
    as that_slideable_list_item_mrpo3s_enums;
import '/app_events/index.dart';
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
