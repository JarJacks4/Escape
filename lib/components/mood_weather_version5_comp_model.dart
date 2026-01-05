import '/components/enter_innerverse_card_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mood_weather_version5_comp_widget.dart'
    show MoodWeatherVersion5CompWidget;
import 'package:flutter/material.dart';

class MoodWeatherVersion5CompModel
    extends FlutterFlowModel<MoodWeatherVersion5CompWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for EnterInnerverseCardVersion5 component.
  late EnterInnerverseCardVersion5Model enterInnerverseCardVersion5Model;

  @override
  void initState(BuildContext context) {
    enterInnerverseCardVersion5Model =
        createModel(context, () => EnterInnerverseCardVersion5Model());
  }

  @override
  void dispose() {
    enterInnerverseCardVersion5Model.dispose();
  }
}
