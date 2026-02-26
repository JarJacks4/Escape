import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'deep_work_modes_version5_model.dart';
export 'deep_work_modes_version5_model.dart';

/// New Component Gen
class DeepWorkModesVersion5Widget extends StatefulWidget {
  const DeepWorkModesVersion5Widget({super.key});

  @override
  State<DeepWorkModesVersion5Widget> createState() =>
      _DeepWorkModesVersion5WidgetState();
}

class _DeepWorkModesVersion5WidgetState
    extends State<DeepWorkModesVersion5Widget> {
  late DeepWorkModesVersion5Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeepWorkModesVersion5Model());
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
