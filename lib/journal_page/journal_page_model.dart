import '/auth/firebase_auth/auth_util.dart';
import '/components/todays_reflection_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'journal_page_widget.dart' show JournalPageWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JournalPageModel extends FlutterFlowModel<JournalPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TodaysReflectionComp component.
  late TodaysReflectionCompModel todaysReflectionCompModel;

  @override
  void initState(BuildContext context) {
    todaysReflectionCompModel =
        createModel(context, () => TodaysReflectionCompModel());
  }

  @override
  void dispose() {
    todaysReflectionCompModel.dispose();
  }
}
