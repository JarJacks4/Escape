import '/components/mind_page_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'mind_page_model.dart';
export 'mind_page_model.dart';

class MindPageWidget extends StatefulWidget {
  const MindPageWidget({super.key});

  static String routeName = 'MindPage';
  static String routePath = 'mindPage';

  @override
  State<MindPageWidget> createState() => _MindPageWidgetState();
}

class _MindPageWidgetState extends State<MindPageWidget> {
  late MindPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MindPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MindPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
                height: 813.13,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).secondary
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: wrapWithModel(
                  model: _model.mindPageVersion5Model,
                  updateCallback: () => safeSetState(() {}),
                  child: MindPageVersion5Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
