import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import 'create_profile_goals_widget.dart' show CreateProfileGoalsWidget;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfileGoalsModel
    extends FlutterFlowModel<CreateProfileGoalsWidget> {
  ///  Local state fields for this component.

  bool selfCareGoals = false;

  List<OnboardingGoalsStruct> listOfGoals = [];
  void addToListOfGoals(OnboardingGoalsStruct item) => listOfGoals.add(item);
  void removeFromListOfGoals(OnboardingGoalsStruct item) =>
      listOfGoals.remove(item);
  void removeAtIndexFromListOfGoals(int index) => listOfGoals.removeAt(index);
  void insertAtIndexInListOfGoals(int index, OnboardingGoalsStruct item) =>
      listOfGoals.insert(index, item);
  void updateListOfGoalsAtIndex(
          int index, Function(OnboardingGoalsStruct) updateFn) =>
      listOfGoals[index] = updateFn(listOfGoals[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
