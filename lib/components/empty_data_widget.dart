import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_data_model.dart';
export 'empty_data_model.dart';

class EmptyDataWidget extends StatefulWidget {
  const EmptyDataWidget({super.key});

  @override
  State<EmptyDataWidget> createState() => _EmptyDataWidgetState();
}

class _EmptyDataWidgetState extends State<EmptyDataWidget>
    with TickerProviderStateMixin {
  late EmptyDataModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyDataModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        FFLocalizations.of(context).getText(
          'eyl811k0' /* How may I help you? */,
        ),
        style: FlutterFlowTheme.of(context).labelLarge.override(
              fontFamily: 'The Seasons',
              color: FlutterFlowTheme.of(context).alternate,
              fontSize: 20.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
            ),
      ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
    );
  }
}
