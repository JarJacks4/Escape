import '/components/habits_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'habits_page_version5_model.dart';
export 'habits_page_version5_model.dart';

class HabitsPageVersion5Widget extends StatefulWidget {
  const HabitsPageVersion5Widget({super.key});

  static String routeName = 'HabitsPageVersion5';
  static String routePath = '/habitsPageVersion5';

  @override
  State<HabitsPageVersion5Widget> createState() =>
      _HabitsPageVersion5WidgetState();
}

class _HabitsPageVersion5WidgetState extends State<HabitsPageVersion5Widget> {
  late HabitsPageVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HabitsPageVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HabitsPageVersion5'});
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
                  model: _model.habitsVersion5Model,
                  updateCallback: () => safeSetState(() {}),
                  child: HabitsVersion5Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
