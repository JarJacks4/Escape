import '/components/breathing_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'tai_chi_moves_choice_model.dart';
export 'tai_chi_moves_choice_model.dart';

class TaiChiMovesChoiceWidget extends StatefulWidget {
  const TaiChiMovesChoiceWidget({super.key});

  static String routeName = 'TaiChiMovesChoice';
  static String routePath = '/taiChiMovesChoice';

  @override
  State<TaiChiMovesChoiceWidget> createState() =>
      _TaiChiMovesChoiceWidgetState();
}

class _TaiChiMovesChoiceWidgetState extends State<TaiChiMovesChoiceWidget> {
  late TaiChiMovesChoiceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaiChiMovesChoiceModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TaiChiMovesChoice'});
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
          child: wrapWithModel(
            model: _model.breathingChoiceCompModel,
            updateCallback: () => safeSetState(() {}),
            child: BreathingChoiceCompWidget(),
          ),
        ),
      ),
    );
  }
}
