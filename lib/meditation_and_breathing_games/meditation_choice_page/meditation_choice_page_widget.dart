import '/components/meditate_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meditation_choice_page_model.dart';
export 'meditation_choice_page_model.dart';

class MeditationChoicePageWidget extends StatefulWidget {
  const MeditationChoicePageWidget({super.key});

  static String routeName = 'MeditationChoicePage';
  static String routePath = 'meditationChoicePage';

  @override
  State<MeditationChoicePageWidget> createState() =>
      _MeditationChoicePageWidgetState();
}

class _MeditationChoicePageWidgetState
    extends State<MeditationChoicePageWidget> {
  late MeditationChoicePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationChoicePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MeditationChoicePage'});
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
            model: _model.meditateChoiceCompModel,
            updateCallback: () => safeSetState(() {}),
            child: MeditateChoiceCompWidget(),
          ),
        ),
      ),
    );
  }
}
