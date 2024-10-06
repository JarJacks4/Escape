import '/components/sounds_comp/sounds_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/headers/header_main_sounds/header_main_sounds_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'sounds_page_main_model.dart';
export 'sounds_page_main_model.dart';

class SoundsPageMainWidget extends StatefulWidget {
  const SoundsPageMainWidget({super.key});

  @override
  State<SoundsPageMainWidget> createState() => _SoundsPageMainWidgetState();
}

class _SoundsPageMainWidgetState extends State<SoundsPageMainWidget>
    with TickerProviderStateMixin {
  late SoundsPageMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoundsPageMainModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SoundsPageMain'});
    animationsMap.addAll({
      'headerMainSoundsOnPageLoadAnimation': AnimationInfo(
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
      'soundsCompOnPageLoadAnimation': AnimationInfo(
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
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 796.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Hero(
                    tag: 'BackgroundPicture',
                    transitionOnUserGestures: true,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1516571748831-5d81767b788d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxzdGFyc3xlbnwwfHx8fDE3MjgxODMyNjF8MA&ixlib=rb-4.0.3&q=80&w=1080',
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x44000220), Color(0xFF000220)],
                    stops: [0.95, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5.0,
                      sigmaY: 5.0,
                    ),
                    child: Container(
                      width: 100.0,
                      height: 0.0,
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 276.0,
                              decoration: const BoxDecoration(
                                color: Color(0x00000220),
                              ),
                              child: wrapWithModel(
                                model: _model.headerMainSoundsModel,
                                updateCallback: () => safeSetState(() {}),
                                child: const Hero(
                                  tag: 'SoundsPage',
                                  transitionOnUserGestures: true,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: HeaderMainSoundsWidget(),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'headerMainSoundsOnPageLoadAnimation']!),
                            ),
                            Container(
                              width: double.infinity,
                              height: 606.0,
                              decoration: const BoxDecoration(
                                color: Color(0x00000220),
                              ),
                              child: wrapWithModel(
                                model: _model.soundsCompModel,
                                updateCallback: () => safeSetState(() {}),
                                child: const Hero(
                                  tag: 'SoundsPage',
                                  transitionOnUserGestures: true,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: SoundsCompWidget(),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'soundsCompOnPageLoadAnimation']!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
