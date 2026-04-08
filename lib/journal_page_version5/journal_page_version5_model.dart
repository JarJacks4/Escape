import '/components/journal_page1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'journal_page_version5_widget.dart' show JournalPageVersion5Widget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JournalPageVersion5Model
    extends FlutterFlowModel<JournalPageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for JournalPage1 component.
  late JournalPage1Model journalPage1Model;

  @override
  void initState(BuildContext context) {
    journalPage1Model = createModel(context, () => JournalPage1Model());
  }

  @override
  void dispose() {
    journalPage1Model.dispose();
  }
}
