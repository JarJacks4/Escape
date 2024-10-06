import '/components/header_main_meditation/header_main_meditation_widget.dart';
import '/components/tabbar_home_meditation/tabbar_home_meditation_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'meditation_page_main_model.dart';
export 'meditation_page_main_model.dart';

class MeditationPageMainWidget extends StatefulWidget {
  const MeditationPageMainWidget({super.key});

  @override
  State<MeditationPageMainWidget> createState() =>
      _MeditationPageMainWidgetState();
}

class _MeditationPageMainWidgetState extends State<MeditationPageMainWidget>
    with TickerProviderStateMixin {
  late MeditationPageMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationPageMainModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MeditationPageMain'});
    animationsMap.addAll({
      'headerMainMeditationOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'tabbarHomeMeditationOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                'https://images.unsplash.com/photo-1513836279014-a89f7a76ae86?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMHx8Zm9yZXN0fGVufDB8fHx8MTcyNDM5MzI3OXww&ixlib=rb-4.0.3&q=80&w=1080',
              ).image,
            ),
          ),
          child: Container(
            width: 100.0,
            height: 154.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xA5903E9F),
                  FlutterFlowTheme.of(context).primaryBackground
                ],
                stops: const [0.0, 1.0],
                begin: const AlignmentDirectional(0.0, -1.0),
                end: const AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: 233.0,
                  decoration: const BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.headerMainMeditationModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const HeaderMainMeditationWidget(),
                  ).animateOnPageLoad(animationsMap[
                      'headerMainMeditationOnPageLoadAnimation']!),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.tabbarHomeMeditationModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const TabbarHomeMeditationWidget(),
                  ).animateOnPageLoad(animationsMap[
                      'tabbarHomeMeditationOnPageLoadAnimation']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
