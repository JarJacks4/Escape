import '/components/mood_result_component_widget.dart';
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
import 'mood_result_page_model.dart';
export 'mood_result_page_model.dart';

class MoodResultPageWidget extends StatefulWidget {
  const MoodResultPageWidget({super.key});

  static String routeName = 'MoodResultPage';
  static String routePath = 'moodResultPage';

  @override
  State<MoodResultPageWidget> createState() => _MoodResultPageWidgetState();
}

class _MoodResultPageWidgetState extends State<MoodResultPageWidget> {
  late MoodResultPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodResultPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MoodResultPage'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 874.0,
              decoration: BoxDecoration(
                color: Color(0xFF0A0A14),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: wrapWithModel(
                  model: _model.moodResultComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MoodResultComponentWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
