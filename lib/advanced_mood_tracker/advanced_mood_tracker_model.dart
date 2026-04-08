import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/components/mood_weather_version5_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/index.dart';
import 'advanced_mood_tracker_widget.dart' show AdvancedMoodTrackerWidget;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
