import '/components/deep_work_modes_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'deep_work_modes_version5_page_model.dart';
export 'deep_work_modes_version5_page_model.dart';

class DeepWorkModesVersion5PageWidget extends StatefulWidget {
  const DeepWorkModesVersion5PageWidget({super.key});

  static String routeName = 'DeepWorkModesVersion5Page';
  static String routePath = 'deepWorkModesVersion5Page';

  @override
  State<DeepWorkModesVersion5PageWidget> createState() =>
      _DeepWorkModesVersion5PageWidgetState();
}

class _DeepWorkModesVersion5PageWidgetState
    extends State<DeepWorkModesVersion5PageWidget> {
  late DeepWorkModesVersion5PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeepWorkModesVersion5PageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DeepWorkModesVersion5Page'});
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
                height: 875.39,
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
                  model: _model.deepWorkModesVersion5Model,
                  updateCallback: () => safeSetState(() {}),
                  child: DeepWorkModesVersion5Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
