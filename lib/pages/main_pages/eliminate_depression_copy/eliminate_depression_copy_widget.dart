import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'eliminate_depression_copy_model.dart';
export 'eliminate_depression_copy_model.dart';

class EliminateDepressionCopyWidget extends StatefulWidget {
  const EliminateDepressionCopyWidget({super.key});

  @override
  State<EliminateDepressionCopyWidget> createState() =>
      _EliminateDepressionCopyWidgetState();
}

class _EliminateDepressionCopyWidgetState
    extends State<EliminateDepressionCopyWidget> {
  late EliminateDepressionCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EliminateDepressionCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EliminateDepressionCopy'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
