import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'influencer_ambassador_program_button_model.dart';
export 'influencer_ambassador_program_button_model.dart';

class InfluencerAmbassadorProgramButtonWidget extends StatefulWidget {
  const InfluencerAmbassadorProgramButtonWidget({super.key});

  @override
  State<InfluencerAmbassadorProgramButtonWidget> createState() =>
      _InfluencerAmbassadorProgramButtonWidgetState();
}

class _InfluencerAmbassadorProgramButtonWidgetState
    extends State<InfluencerAmbassadorProgramButtonWidget>
    with TickerProviderStateMixin {
  late InfluencerAmbassadorProgramButtonModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => InfluencerAmbassadorProgramButtonModel());

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1710.0.ms,
            color: FlutterFlowTheme.of(context).accent1,
            angle: 0.524,
          ),
          SaturateEffect(
            curve: Curves.easeIn,
            delay: 990.0.ms,
            duration: 1250.0.ms,
            begin: 0.51,
            end: 1.87,
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
    return Container(
      width: 58.09,
      height: 49.0,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 30.0,
            child: VerticalDivider(
              thickness: 1.0,
              color: Color(0x8839519F),
            ),
          ),
          FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 44.79,
            icon: Icon(
              FFIcons.kprofit,
              color: FlutterFlowTheme.of(context).accent3,
              size: 24.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ).animateOnPageLoad(animationsMap['iconButtonOnPageLoadAnimation']!),
        ],
      ),
    );
  }
}
