import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'escape_innerverse_model.dart';
export 'escape_innerverse_model.dart';

class EscapeInnerverseWidget extends StatefulWidget {
  const EscapeInnerverseWidget({super.key});

  static String routeName = 'EscapeInnerverse';
  static String routePath = '/escapeInnerverse';

  @override
  State<EscapeInnerverseWidget> createState() => _EscapeInnerverseWidgetState();
}

class _EscapeInnerverseWidgetState extends State<EscapeInnerverseWidget> {
  late EscapeInnerverseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscapeInnerverseModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EscapeInnerverse'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ESCAPE_INNERVERSE_EscapeInnerverse_ON_IN');
      logFirebaseEvent('EscapeInnerverse_custom_action');
      await actions.launchUnrealScene(
        'Animus',
      );
    });
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
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: 779.55,
                  decoration: BoxDecoration(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
