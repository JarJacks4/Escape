import '/components/new_home_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'home_version5_model.dart';
export 'home_version5_model.dart';

class HomeVersion5Widget extends StatefulWidget {
  const HomeVersion5Widget({super.key});

  static String routeName = 'HomeVersion5';
  static String routePath = 'homeVersion5';

  @override
  State<HomeVersion5Widget> createState() => _HomeVersion5WidgetState();
}

class _HomeVersion5WidgetState extends State<HomeVersion5Widget> {
  late HomeVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HomeVersion5'});
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
                height: 792.8,
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
                  model: _model.newHomeVersion5Model,
                  updateCallback: () => safeSetState(() {}),
                  child: NewHomeVersion5Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
