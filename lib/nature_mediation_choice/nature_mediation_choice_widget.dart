import '/components/nature_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nature_mediation_choice_model.dart';
export 'nature_mediation_choice_model.dart';

class NatureMediationChoiceWidget extends StatefulWidget {
  const NatureMediationChoiceWidget({super.key});

  static String routeName = 'NatureMediationChoice';
  static String routePath = 'natureMediationChoice';

  @override
  State<NatureMediationChoiceWidget> createState() =>
      _NatureMediationChoiceWidgetState();
}

class _NatureMediationChoiceWidgetState
    extends State<NatureMediationChoiceWidget> {
  late NatureMediationChoiceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NatureMediationChoiceModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NatureMediationChoice'});
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
            model: _model.natureChoiceCompModel,
            updateCallback: () => safeSetState(() {}),
            child: NatureChoiceCompWidget(),
          ),
        ),
      ),
    );
  }
}
