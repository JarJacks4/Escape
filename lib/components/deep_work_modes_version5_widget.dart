import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
