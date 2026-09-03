import '/components/button7_widget.dart';
import '/components/move_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_palette/material_palette.dart';
import 'today_s_moves_overview_model.dart';
export 'today_s_moves_overview_model.dart';

class TodaySMovesOverviewWidget extends StatefulWidget {
  const TodaySMovesOverviewWidget({super.key});

  static String routeName = 'TodaySMovesOverview';
  static String routePath = '/todaySMovesOverview';

  @override
  State<TodaySMovesOverviewWidget> createState() =>
      _TodaySMovesOverviewWidgetState();
}

class _TodaySMovesOverviewWidgetState extends State<TodaySMovesOverviewWidget> {
  late TodaySMovesOverviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TodaySMovesOverviewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TodaySMovesOverview'});
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
        backgroundColor: Color(0xFF0F121F),
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return FbmGradientShaderFill(
                  width: constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : 200.0,
                  height: 200.0,
                  params: ShaderParams(values: {
                    'gradientAngle': 180.0,
                    'gradientScale': 0.89,
                    'gradientOffset': 0.0,
                    'noiseIntensity': 0.32,
                    'ditherStrength': 2.51,
                    'ditherScale': 0.29,
                    'animSpeed': 1.46,
                    'octaves': 6.06,
                    'lacunarity': 2.35,
                    'persistence': 0.5,
                    'noiseScale': 6.36,
                    'colorCount': 7.0,
                    'softness': 0.0,
                    'exposure': 1.0,
                    'contrast': 1.0,
                    'bumpStrength': 0.0,
                    'lightDirX': 0.55,
                    'lightDirY': 0.45,
                    'lightDirZ': 1.0,
                    'lightIntensity': 1.15,
                    'ambient': 0.7,
                    'specular': 0.29,
                    'shininess': 40.76,
                    'metallic': 1.0,
                    'roughness': 1.0,
                    'edgeFade': 1.72,
                    'edgeFadeMode': 0.0,
                    'sharpness': 2.2
                  }, colors: {
                    'color0': FlutterFlowTheme.of(context).primaryBackground,
                    'color1': FlutterFlowTheme.of(context).secondaryBackground,
                    'color2': Color(0xFF0F121F),
                    'color3': Color(0xFFE1E4F0),
                    'color4': FlutterFlowTheme.of(context).primaryBackground,
                    'color5': Color(0xFF0F121F),
                    'color6': FlutterFlowTheme.of(context).secondaryBackground,
                    'color7': Color(0x00808080),
                    'color8': Color(0x00808080),
                    'color9': Color(0x00808080)
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
                        EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'da2u21i8' /* 9:41 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                  lineHeight: 1.3,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.light_mode_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 14.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'hu4resym' /* Escape */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 1.3,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: SingleChildScrollView(
                      primary: false,
                      controller: _model.columnScrollController,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'lfasj9r3' /* BODY */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                              lineHeight: 1.2,
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'gkfgj1au' /* Today's Moves */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              font: GoogleFonts.cormorantSc(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontStyle,
                                              lineHeight: 1.2,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.schedule_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 16.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'me3l4r6v' /* About 4 minutes · 3 moves */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Container(
                                          child: Container(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2bct6wdz' /* No rush. Preview each movement... */,
                                              ),
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        lineHeight: 1.5,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      wrapWithModel(
                                        model: _model.moveCardModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: MoveCardWidget(
                                          duration: '40s',
                                          orbColor: FlutterFlowTheme.of(context)
                                              .primary,
                                          title: 'Plank',
                                          type: 'Hold',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.moveCardModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: MoveCardWidget(
                                          duration: 'unhurried',
                                          orbColor: Color(0xFF80ED99),
                                          title: 'Gentle Burpee',
                                          type: '8 reps',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.moveCardModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: MoveCardWidget(
                                          duration: '30s',
                                          orbColor: Color(0xFFFFB2A6),
                                          title: 'Resting Fold',
                                          type: 'Rest',
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ].divide(SizedBox(height: 24.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Container(
                      child: wrapWithModel(
                        model: _model.buttonModel,
                        updateCallback: () => safeSetState(() {}),
                        child: Button7Widget(
                          icon: false,
                          iconPresent: false,
                          iconEnd: false,
                          iconEndPresent: false,
                          content: 'Start Session',
                          variant: 'primary',
                          size: 'large',
                          fullWidth: true,
                          loading: false,
                          disabled: false,
                        ),
                      ),
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
