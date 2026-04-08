import '/components/mood_scan_help_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mood_scan_help_model.dart';
export 'mood_scan_help_model.dart';

class MoodScanHelpWidget extends StatefulWidget {
  const MoodScanHelpWidget({super.key});

  static String routeName = 'MoodScanHelp';
  static String routePath = 'moodScanHelp';

  @override
  State<MoodScanHelpWidget> createState() => _MoodScanHelpWidgetState();
}

class _MoodScanHelpWidgetState extends State<MoodScanHelpWidget> {
  late MoodScanHelpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodScanHelpModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MoodScanHelp'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: wrapWithModel(
                model: _model.moodScanHelpCompModel,
                updateCallback: () => safeSetState(() {}),
                child: MoodScanHelpCompWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
