import '/components/starting_realm_comp_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'starting_realm_model.dart';
export 'starting_realm_model.dart';

class StartingRealmWidget extends StatefulWidget {
  const StartingRealmWidget({super.key});

  static String routeName = 'StartingRealm';
  static String routePath = 'startingRealm';

  @override
  State<StartingRealmWidget> createState() => _StartingRealmWidgetState();
}

class _StartingRealmWidgetState extends State<StartingRealmWidget> {
  late StartingRealmModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartingRealmModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'StartingRealm'});
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
                  model: _model.startingRealmCompVersion5Model,
                  updateCallback: () => safeSetState(() {}),
                  child: StartingRealmCompVersion5Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
