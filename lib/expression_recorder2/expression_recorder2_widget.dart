import '/components/expression_recorder_camera_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'expression_recorder2_model.dart';
export 'expression_recorder2_model.dart';

class ExpressionRecorder2Widget extends StatefulWidget {
  const ExpressionRecorder2Widget({super.key});

  static String routeName = 'ExpressionRecorder2';
  static String routePath = '/expressionRecorder2';

  @override
  State<ExpressionRecorder2Widget> createState() =>
      _ExpressionRecorder2WidgetState();
}

class _ExpressionRecorder2WidgetState extends State<ExpressionRecorder2Widget> {
  late ExpressionRecorder2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExpressionRecorder2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ExpressionRecorder2'});
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
        backgroundColor: Color(0xFF1A1614),
        body: wrapWithModel(
          model: _model.expressionRecorderCameraCompModel,
          updateCallback: () => safeSetState(() {}),
          child: ExpressionRecorderCameraCompWidget(),
        ),
      ),
    );
  }
}
