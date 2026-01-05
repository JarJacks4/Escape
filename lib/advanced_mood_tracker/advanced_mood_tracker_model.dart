import '/components/mood_weather_version5_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'advanced_mood_tracker_widget.dart' show AdvancedMoodTrackerWidget;
import 'package:flutter/material.dart';

class AdvancedMoodTrackerModel
    extends FlutterFlowModel<AdvancedMoodTrackerWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [AI Agent - Send Message to AdvancedMoodAnalyzer] action in AdvancedMoodTracker widget.
  String? lucilleMessage;
  // Stores action output result for [AI Agent - Send Message to AdvancedMoodAnalyzer] action in AdvancedMoodTracker widget.
  String? advancedMoodScan;
  // Stores action output result for [AI Agent - Send Message to AdvancedMoodAnalyzer] action in AdvancedMoodTracker widget.
  String? generateGentleTextBasedOnMood;
  // Stores action output result for [AI Agent - Send Message to AdvancedMoodAnalyzer] action in AdvancedMoodTracker widget.
  String? emotionalInsight;
  // Stores action output result for [AI Agent - Send Message to AdvancedMoodAnalyzer] action in AdvancedMoodTracker widget.
  String? positiveSingleWord;
  // Stores action output result for [AI Agent - Send Message to AdvancedMoodAnalyzer] action in AdvancedMoodTracker widget.
  String? neutralSingleWord;
  // Stores action output result for [AI Agent - Send Message to AdvancedMoodAnalyzer] action in AdvancedMoodTracker widget.
  String? stressedSingleWord;
  // Stores action output result for [AI Agent - Send Message to AdvancedMoodAnalyzer] action in AdvancedMoodTracker widget.
  String? heavySingleWord;
  // Stores action output result for [AI Agent - Send Message to AdvancedMoodAnalyzer] action in AdvancedMoodTracker widget.
  String? aIMoodAnalyzeAction;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  List<String>? get choiceChipsValues1 => choiceChipsValueController1?.value;
  set choiceChipsValues1(List<String>? val) =>
      choiceChipsValueController1?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  List<String>? get choiceChipsValues2 => choiceChipsValueController2?.value;
  set choiceChipsValues2(List<String>? val) =>
      choiceChipsValueController2?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController3;
  List<String>? get choiceChipsValues3 => choiceChipsValueController3?.value;
  set choiceChipsValues3(List<String>? val) =>
      choiceChipsValueController3?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController4;
  List<String>? get choiceChipsValues4 => choiceChipsValueController4?.value;
  set choiceChipsValues4(List<String>? val) =>
      choiceChipsValueController4?.value = val;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  // State field(s) for Column widget.
  ScrollController? columnController5;
  // State field(s) for Column widget.
  ScrollController? columnController6;
  // Model for MoodWeatherVersion5Comp component.
  late MoodWeatherVersion5CompModel moodWeatherVersion5CompModel;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
    columnController5 = ScrollController();
    columnController6 = ScrollController();
    moodWeatherVersion5CompModel =
        createModel(context, () => MoodWeatherVersion5CompModel());
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    columnController4?.dispose();
    columnController5?.dispose();
    columnController6?.dispose();
    moodWeatherVersion5CompModel.dispose();
  }
}
