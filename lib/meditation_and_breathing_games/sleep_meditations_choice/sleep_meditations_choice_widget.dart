import '/components/sleep_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'sleep_meditations_choice_model.dart';
export 'sleep_meditations_choice_model.dart';

class SleepMeditationsChoiceWidget extends StatefulWidget {
  const SleepMeditationsChoiceWidget({super.key});

  static String routeName = 'SleepMeditationsChoice';
  static String routePath = '/sleepMeditationsChoice';

  @override
  State<SleepMeditationsChoiceWidget> createState() =>
      _SleepMeditationsChoiceWidgetState();
}

class _SleepMeditationsChoiceWidgetState
    extends State<SleepMeditationsChoiceWidget> {
  late SleepMeditationsChoiceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SleepMeditationsChoiceModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SleepMeditationsChoice'});
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
                child: wrapWithModel(
                  model: _model.sleepChoiceCompModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SleepChoiceCompWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
