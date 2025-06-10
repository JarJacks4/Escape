import '/components/meditation_help_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meditation_tutorial_model.dart';
export 'meditation_tutorial_model.dart';

class MeditationTutorialWidget extends StatefulWidget {
  const MeditationTutorialWidget({super.key});

  static String routeName = 'MeditationTutorial';
  static String routePath = 'meditationTutorial';

  @override
  State<MeditationTutorialWidget> createState() =>
      _MeditationTutorialWidgetState();
}

class _MeditationTutorialWidgetState extends State<MeditationTutorialWidget> {
  late MeditationTutorialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationTutorialModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MeditationTutorial'});
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
        body: wrapWithModel(
          model: _model.meditationHelpCompModel,
          updateCallback: () => safeSetState(() {}),
          child: MeditationHelpCompWidget(),
        ),
      ),
    );
  }
}
