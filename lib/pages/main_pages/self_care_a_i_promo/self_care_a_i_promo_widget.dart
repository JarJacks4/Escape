import '/components/lucille_promo_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'self_care_a_i_promo_model.dart';
export 'self_care_a_i_promo_model.dart';

class SelfCareAIPromoWidget extends StatefulWidget {
  const SelfCareAIPromoWidget({super.key});

  @override
  State<SelfCareAIPromoWidget> createState() => _SelfCareAIPromoWidgetState();
}

class _SelfCareAIPromoWidgetState extends State<SelfCareAIPromoWidget>
    with TickerProviderStateMixin {
  late SelfCareAIPromoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelfCareAIPromoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SelfCareAIPromo'});
    animationsMap.addAll({
      'lucillePromoBottomSheetOnPageLoadAnimation': AnimationInfo(
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
        body: wrapWithModel(
          model: _model.lucillePromoBottomSheetModel,
          updateCallback: () => safeSetState(() {}),
          child: LucillePromoBottomSheetWidget(),
        ).animateOnPageLoad(
            animationsMap['lucillePromoBottomSheetOnPageLoadAnimation']!),
      ),
    );
  }
}
