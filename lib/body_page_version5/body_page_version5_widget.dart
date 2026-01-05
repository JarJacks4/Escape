import '/components/body_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'body_page_version5_model.dart';
export 'body_page_version5_model.dart';

class BodyPageVersion5Widget extends StatefulWidget {
  const BodyPageVersion5Widget({super.key});

  static String routeName = 'BodyPageVersion5';
  static String routePath = 'bodyPageVersion5';

  @override
  State<BodyPageVersion5Widget> createState() => _BodyPageVersion5WidgetState();
}

class _BodyPageVersion5WidgetState extends State<BodyPageVersion5Widget> {
  late BodyPageVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodyPageVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BodyPageVersion5'});
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
                height: 877.78,
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
                  model: _model.bodyPageModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BodyPageWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
