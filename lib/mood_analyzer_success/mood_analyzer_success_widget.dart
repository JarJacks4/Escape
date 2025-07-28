import '/components/mood_analyzer_success_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'mood_analyzer_success_model.dart';
export 'mood_analyzer_success_model.dart';

class MoodAnalyzerSuccessWidget extends StatefulWidget {
  const MoodAnalyzerSuccessWidget({super.key});

  static String routeName = 'MoodAnalyzerSuccess';
  static String routePath = '/moodAnalyzerSuccess';

  @override
  State<MoodAnalyzerSuccessWidget> createState() =>
      _MoodAnalyzerSuccessWidgetState();
}

class _MoodAnalyzerSuccessWidgetState extends State<MoodAnalyzerSuccessWidget>
    with TickerProviderStateMixin {
  late MoodAnalyzerSuccessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodAnalyzerSuccessModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MoodAnalyzerSuccess'});
    animationsMap.addAll({
      'moodAnalyzerSuccessCompOnPageLoadAnimation': AnimationInfo(
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
          model: _model.moodAnalyzerSuccessCompModel,
          updateCallback: () => safeSetState(() {}),
          updateOnChange: true,
          child: Hero(
            tag: 'MoodAnalyzerAnimation',
            transitionOnUserGestures: true,
            child: Material(
              color: Colors.transparent,
              child: MoodAnalyzerSuccessCompWidget(),
            ),
          ),
        ).animateOnPageLoad(
            animationsMap['moodAnalyzerSuccessCompOnPageLoadAnimation']!),
      ),
    );
  }
}
