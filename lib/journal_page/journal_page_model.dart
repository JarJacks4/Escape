import '/auth/firebase_auth/auth_util.dart';
import '/components/confetti_page_basic_comp_widget.dart';
import '/components/todays_reflection_comp_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'journal_page_widget.dart' show JournalPageWidget;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JournalPageModel extends FlutterFlowModel<JournalPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TodaysReflectionComp component.
  late TodaysReflectionCompModel todaysReflectionCompModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    todaysReflectionCompModel =
        createModel(context, () => TodaysReflectionCompModel());
  }

  @override
  void dispose() {
    todaysReflectionCompModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
