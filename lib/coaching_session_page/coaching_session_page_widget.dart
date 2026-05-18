import '/components/coaching_session_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'coaching_session_page_model.dart';
export 'coaching_session_page_model.dart';

class CoachingSessionPageWidget extends StatefulWidget {
  const CoachingSessionPageWidget({super.key});

  static String routeName = 'coachingSessionPage';
  static String routePath = '/coachingSessionPage';

  @override
  State<CoachingSessionPageWidget> createState() =>
      _CoachingSessionPageWidgetState();
}

class _CoachingSessionPageWidgetState extends State<CoachingSessionPageWidget> {
  late CoachingSessionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoachingSessionPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'coachingSessionPage'});
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
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).alternate,
                    FlutterFlowTheme.of(context).tertiary
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: wrapWithModel(
                model: _model.coachingSessionModel,
                updateCallback: () => safeSetState(() {}),
                child: CoachingSessionWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
