import '/components/mood_scanner_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'mood_scanner_page_model.dart';
export 'mood_scanner_page_model.dart';

class MoodScannerPageWidget extends StatefulWidget {
  const MoodScannerPageWidget({super.key});

  static String routeName = 'MoodScannerPage';
  static String routePath = '/moodScannerPage';

  @override
  State<MoodScannerPageWidget> createState() => _MoodScannerPageWidgetState();
}

class _MoodScannerPageWidgetState extends State<MoodScannerPageWidget> {
  late MoodScannerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodScannerPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MoodScannerPage'});
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
                  begin: AlignmentDirectional(1.0, -1.0),
                  end: AlignmentDirectional(-1.0, 1.0),
                ),
              ),
              child: wrapWithModel(
                model: _model.moodScannerComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: MoodScannerComponentWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
