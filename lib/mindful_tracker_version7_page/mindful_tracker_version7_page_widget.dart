import '/components/mindful_tracker_version7_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'mindful_tracker_version7_page_model.dart';
export 'mindful_tracker_version7_page_model.dart';

class MindfulTrackerVersion7PageWidget extends StatefulWidget {
  const MindfulTrackerVersion7PageWidget({super.key});

  static String routeName = 'MindfulTrackerVersion7Page';
  static String routePath = '/mindfulTrackerVersion7Page';

  @override
  State<MindfulTrackerVersion7PageWidget> createState() =>
      _MindfulTrackerVersion7PageWidgetState();
}

class _MindfulTrackerVersion7PageWidgetState
    extends State<MindfulTrackerVersion7PageWidget> {
  late MindfulTrackerVersion7PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MindfulTrackerVersion7PageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MindfulTrackerVersion7Page'});
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
              Expanded(
                child: wrapWithModel(
                  model: _model.mindfulTrackerVersion7Model,
                  updateCallback: () => safeSetState(() {}),
                  child: MindfulTrackerVersion7Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
