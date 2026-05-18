import '/components/mood_saver_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'mood_saver_page_model.dart';
export 'mood_saver_page_model.dart';

class MoodSaverPageWidget extends StatefulWidget {
  const MoodSaverPageWidget({super.key});

  static String routeName = 'moodSaverPage';
  static String routePath = '/moodSaverPage';

  @override
  State<MoodSaverPageWidget> createState() => _MoodSaverPageWidgetState();
}

class _MoodSaverPageWidgetState extends State<MoodSaverPageWidget> {
  late MoodSaverPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodSaverPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'moodSaverPage'});
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
                model: _model.moodSaverComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: MoodSaverComponentWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
