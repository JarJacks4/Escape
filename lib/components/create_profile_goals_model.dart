import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_profile_goals_widget.dart' show CreateProfileGoalsWidget;
import 'package:flutter/material.dart';

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
