import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'analyzing_mood_status_page_model.dart';
export 'analyzing_mood_status_page_model.dart';

class AnalyzingMoodStatusPageWidget extends StatefulWidget {
  const AnalyzingMoodStatusPageWidget({super.key});

  @override
  State<AnalyzingMoodStatusPageWidget> createState() =>
      _AnalyzingMoodStatusPageWidgetState();
}

class _AnalyzingMoodStatusPageWidgetState
    extends State<AnalyzingMoodStatusPageWidget> {
  late AnalyzingMoodStatusPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalyzingMoodStatusPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AnalyzingMoodStatusPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ANALYZING_MOOD_STATUS_AnalyzingMoodStatu');
      logFirebaseEvent('AnalyzingMoodStatusPage_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      logFirebaseEvent('AnalyzingMoodStatusPage_navigate_to');

      context.pushNamed(
        'DeepFeelingsResponse',
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 7),
          ),
        },
      );
    });
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
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.5,
              decoration: BoxDecoration(),
              child: Opacity(
                opacity: 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Clean_and_organic_AI_interface_by_milkinside.gif',
                    width: 200.0,
                    height: 683.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 100.0, 8.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '7bhimwmy' /* Analyzing Mood... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'The Seasons',
                            fontSize: 28.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Logo_ESCAPE_DarkBlue.png',
                  width: 106.46,
                  height: 95.4,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
