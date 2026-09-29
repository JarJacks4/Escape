import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_palette/material_palette.dart';
import 'body_session_complete_back_to_home_model.dart';
export 'body_session_complete_back_to_home_model.dart';

class BodySessionCompleteBackToHomeWidget extends StatefulWidget {
  const BodySessionCompleteBackToHomeWidget({super.key});

  static String routeName = 'BodySessionCompleteBackToHome';
  static String routePath = '/bodySessionCompleteBackToHome';

  @override
  State<BodySessionCompleteBackToHomeWidget> createState() =>
      _BodySessionCompleteBackToHomeWidgetState();
}

class _BodySessionCompleteBackToHomeWidgetState
    extends State<BodySessionCompleteBackToHomeWidget> {
  late BodySessionCompleteBackToHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodySessionCompleteBackToHomeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BodySessionCompleteBackToHome'});
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
        backgroundColor: Color(0xFF1B2137),
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return FbmGradientShaderFill(
                  width: constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : 200.0,
                  height: double.infinity,
                  params: ShaderParams(values: {
                    'gradientAngle': 123.64,
                    'gradientScale': 1.27,
                    'gradientOffset': 0.19,
                    'noiseIntensity': 0.81,
                    'ditherStrength': 0.0,
                    'ditherScale': 1.0,
                    'animSpeed': 0.33,
                    'octaves': 6.06,
                    'lacunarity': 2.35,
                    'persistence': 0.5,
                    'noiseScale': 4.5,
                    'colorCount': 3.0,
                    'softness': 1.0,
                    'exposure': 1.0,
                    'contrast': 1.0,
                    'bumpStrength': 0.1,
                    'lightDirX': 0.5,
                    'lightDirY': 0.6,
                    'lightDirZ': 0.9,
                    'lightIntensity': 0.89,
                    'ambient': 0.29,
                    'specular': 0.16,
                    'shininess': 3.06,
                    'metallic': 0.0,
                    'roughness': 0.49,
                    'edgeFade': 0.0,
                    'edgeFadeMode': 1.0
                  }, colors: {
                    'color3': Color(0x00808080),
                    'color4': Color(0x00808080),
                    'color5': Color(0x00808080),
                    'color6': Color(0x00808080),
                    'color7': Color(0x00808080),
                    'color8': Color(0x00808080),
                    'color9': Color(0x00808080),
                    'color1': FlutterFlowTheme.of(context).tertiary,
                    'color2': FlutterFlowTheme.of(context).alternate,
                    'color0': FlutterFlowTheme.of(context).primary
                  }),
                  animationMode: ShaderAnimationMode.continuous,
                  cache: false,
                );
              },
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
                    child: Container(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 200.0,
                          height: 200.0,
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              Container(
                                width: 180.0,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9999.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Color(0x1A141A2D),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9999.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Color(0x33141A2D),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 90.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 40.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      offset: Offset(
                                        0.0,
                                        0.0,
                                      ),
                                    )
                                  ],
                                  gradient: RadialGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).tertiary,
                                      FlutterFlowTheme.of(context).alternate
                                    ],
                                    stops: [0.0, 1.0],
                                    center: Alignment(0.0, 0.0),
                                    radius: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(9999.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 0.0,
                                        height: 0.0,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.check_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        size: 40.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'dyyfw61y' /* You showed up for
yourself */
                                ,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.cormorantSc(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'oggxklh1' /* That's a small, kind thing you... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 100.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              logFirebaseEvent('BODY_SESSION_COMPLETE_back_home_ON_TAP');
                              context.goNamed(HomeVersion5Widget.routeName);
                            },
                            text: FFLocalizations.of(context).getText(
                              'awzclird' /* Back to Home */,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              height: 57.1,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).accent3,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.cormorantSc(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 32.0)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
