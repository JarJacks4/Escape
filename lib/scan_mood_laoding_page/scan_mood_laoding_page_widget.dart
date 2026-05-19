import '/components/scan_mood_laoding_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'scan_mood_laoding_page_model.dart';
export 'scan_mood_laoding_page_model.dart';

class ScanMoodLaodingPageWidget extends StatefulWidget {
  const ScanMoodLaodingPageWidget({super.key});

  static String routeName = 'ScanMoodLaodingPage';
  static String routePath = '/scanMoodLaodingPage';

  @override
  State<ScanMoodLaodingPageWidget> createState() =>
      _ScanMoodLaodingPageWidgetState();
}

class _ScanMoodLaodingPageWidgetState extends State<ScanMoodLaodingPageWidget> {
  late ScanMoodLaodingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanMoodLaodingPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ScanMoodLaodingPage'});
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
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: wrapWithModel(
                model: _model.scanMoodLaodingComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: ScanMoodLaodingComponentWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
