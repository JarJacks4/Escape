import '/components/reset_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'reset_page_model.dart';
export 'reset_page_model.dart';

class ResetPageWidget extends StatefulWidget {
  const ResetPageWidget({super.key});

  static String routeName = 'ResetPage';
  static String routePath = 'resetPage';

  @override
  State<ResetPageWidget> createState() => _ResetPageWidgetState();
}

class _ResetPageWidgetState extends State<ResetPageWidget> {
  late ResetPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ResetPage'});
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
                height: 872.8,
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
                  model: _model.resetVersion5Model,
                  updateCallback: () => safeSetState(() {}),
                  child: ResetVersion5Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
