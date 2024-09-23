import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/meditation_and_sounds/header_home/header_home_widget.dart';
import '/meditation_and_sounds/home_comp/home_comp_widget.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_home_model.dart';
export 'new_home_model.dart';

class NewHomeWidget extends StatefulWidget {
  const NewHomeWidget({super.key});

  @override
  State<NewHomeWidget> createState() => _NewHomeWidgetState();
}

class _NewHomeWidgetState extends State<NewHomeWidget>
    with TickerProviderStateMixin {
  late NewHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewHomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'NewHome'});
    animationsMap.addAll({
      'headerHomeOnPageLoadAnimation': AnimationInfo(
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
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'homeCompOnPageLoadAnimation': AnimationInfo(
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
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
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
              fit: BoxFit.fill,
              alignment: AlignmentDirectional(1.0, 0.0),
              image: Image.network(
                'https://images.unsplash.com/photo-1533093818119-ac1fa47a6d59?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzZWxmJTIwY2FyZXxlbnwwfHx8fDE3MjQzOTM1ODZ8MA&ixlib=rb-4.0.3&q=80&w=1080',
              ).image,
            ),
          ),
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x9BE7C8E7), Color(0xE1FFFFFF)],
                stops: [0.0, 0.8],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: wrapWithModel(
                      model: _model.headerHomeModel,
                      updateCallback: () => safeSetState(() {}),
                      child: HeaderHomeWidget(),
                    ).animateOnPageLoad(
                        animationsMap['headerHomeOnPageLoadAnimation']!),
                  ),
                  Flexible(
                    flex: 1,
                    child: wrapWithModel(
                      model: _model.homeCompModel,
                      updateCallback: () => safeSetState(() {}),
                      child: HomeCompWidget(),
                    ).animateOnPageLoad(
                        animationsMap['homeCompOnPageLoadAnimation']!),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
