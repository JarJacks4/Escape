import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:material_palette/material_palette.dart';
import 'voice_chat_with_lucille_comp_model.dart';
export 'voice_chat_with_lucille_comp_model.dart';

/// New Component Gen
class VoiceChatWithLucilleCompWidget extends StatefulWidget {
  const VoiceChatWithLucilleCompWidget({super.key});

  @override
  State<VoiceChatWithLucilleCompWidget> createState() =>
      _VoiceChatWithLucilleCompWidgetState();
}

class _VoiceChatWithLucilleCompWidgetState
    extends State<VoiceChatWithLucilleCompWidget> {
  late VoiceChatWithLucilleCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoiceChatWithLucilleCompModel());
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
      height: 970.32,
      decoration: BoxDecoration(),
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF040509),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/AI_Loader_Exploration_-_GIF.gif',
                  ).image,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 80.0,
                    sigmaY: 80.0,
                  ),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x7B39519F),
                          Color(0x5CD0E3F7),
                          Color(0x80673AB7)
                        ],
                        stops: [0.0, 0.5, 1.0],
                        begin: AlignmentDirectional(1.0, -0.64),
                        end: AlignmentDirectional(-1.0, 0.64),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 56.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 18.0,
                                buttonSize: 43.19,
                                fillColor: Color(0xFF1A1A1A),
                                icon: Icon(
                                  Icons.chevron_left,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'VOICE_CHAT_WITH_LUCILLE_chevron_left_ICN');
                                  logFirebaseEvent(
                                      'IconButton_haptic_feedback');
                                  HapticFeedback.heavyImpact();
                                  logFirebaseEvent('IconButton_navigate_back');
                                  context.safePop();
                                },
                              ),
                              Container(
                                height: 36.0,
                                decoration: BoxDecoration(
                                  color: Color(0x4BF0831A),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 40.0,
                                      color: Color(0x5BFCC462),
                                      offset: Offset(
                                        0.0,
                                        0.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(18.0),
                                  border: Border.all(
                                    color: Color(0x42EDF1F7),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '7hj41pe0' /* Lucille Self-Care AI */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Container(
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF3A1A3A),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'm6cpsu9s' /* Beta */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFCC88CC),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 18.0,
                                buttonSize: 39.06,
                                fillColor: Color(0xFF1A1A1A),
                                icon: Icon(
                                  Icons.history_rounded,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 32.0, 24.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 280.0,
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 253.1,
                                    height: 253.1,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        alignment:
                                            AlignmentDirectional(-1.0, 1.0),
                                        image: Image.asset(
                                          'assets/images/7b5466eebefd1ecf1b8b13a24cd282703941d5c8.png',
                                        ).image,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 40.0,
                                          color: Color(0xAAEDF1F7),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFCC44CC),
                                          Color(0xFF7700AA)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0x72EDF1F7),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 296.0,
                                height: 176.9,
                                decoration: BoxDecoration(
                                  color: Color(0x46EDF1F7),
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: Color(0x48D0E3F7),
                                  ),
                                ),
                                child: RadialPixelDissolveShaderWrap(
                                  params: ShaderParams(values: {
                                    'centerX': 0.5,
                                    'centerY': 0.5,
                                    'scale': 1.0,
                                    'pixelSize': 5.11,
                                    'edgeWidth': 0.35,
                                    'scatter': 0.36,
                                    'noiseAmount': 0.93,
                                    'speed': 0.21
                                  }),
                                  animationMode: ShaderAnimationMode.explicit,
                                  animationConfig: ShaderAnimationConfig(
                                      duration: Duration(
                                          milliseconds: (3700.0).round()),
                                      curve: Curves.easeIn,
                                      invert: true),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'xrh5qade' /* You Can Chat With Me Here By T... */,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 4,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 20.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'nq72c8az' /* I'm Listening... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xABD0E3F7),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Color(0x5DD0E3F7),
                                    borderRadius: 24.0,
                                    buttonSize: 48.0,
                                    fillColor: Color(0xFF1A1A1A),
                                    icon: Icon(
                                      Icons.volume_down_rounded,
                                      color: Color(0xFF886688),
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Container(
                                    width: 98.9,
                                    height: 98.9,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0x65EDF1F7),
                                      ),
                                    ),
                                    child: Lottie.asset(
                                      'assets/jsons/Enable_mic.json',
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.contain,
                                      animate: true,
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Color(0x7BD0E3F7),
                                    borderRadius: 24.0,
                                    buttonSize: 48.0,
                                    fillColor: Color(0xFF1A1A1A),
                                    icon: Icon(
                                      Icons.chat_bubble_outline_rounded,
                                      color: Color(0xFF886688),
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'VOICE_CHAT_WITH_LUCILLE_chat_bubble_outl');
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.pushNamed(
                                          ChatWithLucilleVersion5Widget
                                              .routeName);
                                    },
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Container(
                            height: 32.0,
                          ),
                        ),
                      ],
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
