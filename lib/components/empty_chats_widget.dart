import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'empty_chats_model.dart';
export 'empty_chats_model.dart';

class EmptyChatsWidget extends StatefulWidget {
  const EmptyChatsWidget({super.key});

  @override
  State<EmptyChatsWidget> createState() => _EmptyChatsWidgetState();
}

class _EmptyChatsWidgetState extends State<EmptyChatsWidget>
    with TickerProviderStateMixin {
  late EmptyChatsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyChatsModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2400.0.ms,
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
    return Container(
      width: double.infinity,
      height: 500.0,
      decoration: BoxDecoration(),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '68sf12ey' /* No chats yet */,
                ),
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'WorkSans',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Icon(
                Icons.auto_awesome,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
          Text(
            FFLocalizations.of(context).getText(
              '6dbxhmne' /* Start a conversation below! */,
            ),
            style: FlutterFlowTheme.of(context).labelSmall.override(
                  fontFamily: 'WorkSans',
                  letterSpacing: 0.0,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'zuuqxi5k' /* Powered by */,
                    ),
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'WorkSans',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/Logo_ESCAPE_Black.png',
                    height: 26.67,
                    fit: BoxFit.contain,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation']!),
                ),
              ],
            ),
          ),
        ].divide(SizedBox(height: 4.0)),
      ),
    );
  }
}
