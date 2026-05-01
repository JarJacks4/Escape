import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'stress_levels_model.dart';
export 'stress_levels_model.dart';

class StressLevelsWidget extends StatefulWidget {
  const StressLevelsWidget({super.key});

  @override
  State<StressLevelsWidget> createState() => _StressLevelsWidgetState();
}

class _StressLevelsWidgetState extends State<StressLevelsWidget> {
  late StressLevelsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StressLevelsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
