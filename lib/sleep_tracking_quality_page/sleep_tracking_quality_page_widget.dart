import '/components/sleep_tracking_quality_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'sleep_tracking_quality_page_model.dart';
export 'sleep_tracking_quality_page_model.dart';

class SleepTrackingQualityPageWidget extends StatefulWidget {
  const SleepTrackingQualityPageWidget({super.key});

  static String routeName = 'SleepTrackingQualityPage';
  static String routePath = '/sleepTrackingQualityPage';

  @override
  State<SleepTrackingQualityPageWidget> createState() =>
      _SleepTrackingQualityPageWidgetState();
}

class _SleepTrackingQualityPageWidgetState
    extends State<SleepTrackingQualityPageWidget> {
  late SleepTrackingQualityPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SleepTrackingQualityPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SleepTrackingQualityPage'});
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 852.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: wrapWithModel(
                  model: _model.sleepTrackingQualityModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SleepTrackingQualityWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
