import '/components/journal_page1_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'ritual_spark_journal_page_version5_widget.dart'
    show RitualSparkJournalPageVersion5Widget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RitualSparkJournalPageVersion5Model
    extends FlutterFlowModel<RitualSparkJournalPageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for journalPage1Version5 component.
  late JournalPage1Version5Model journalPage1Version5Model;

  @override
  void initState(BuildContext context) {
    journalPage1Version5Model =
        createModel(context, () => JournalPage1Version5Model());
  }

  @override
  void dispose() {
    journalPage1Version5Model.dispose();
  }
}
