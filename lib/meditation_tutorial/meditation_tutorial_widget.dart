import '/components/meditation_help_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'meditation_tutorial_model.dart';
export 'meditation_tutorial_model.dart';

class MeditationTutorialWidget extends StatefulWidget {
  const MeditationTutorialWidget({super.key});

  static String routeName = 'MeditationTutorial';
  static String routePath = '/meditationTutorial';

  @override
  State<MeditationTutorialWidget> createState() =>
      _MeditationTutorialWidgetState();
}

class _MeditationTutorialWidgetState extends State<MeditationTutorialWidget>
    with TickerProviderStateMixin {
  late MeditationTutorialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationTutorialModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MeditationTutorial'});
    animationsMap.addAll({
      'meditationHelpCompOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
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
        ).animateOnPageLoad(
            animationsMap['meditationHelpCompOnPageLoadAnimation']!),
      ),
    );
  }
}
