import '/components/sleep_stage_row_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_palette/material_palette.dart';
import 'detailed_sleep_analytics_model.dart';
export 'detailed_sleep_analytics_model.dart';

class DetailedSleepAnalyticsWidget extends StatefulWidget {
  const DetailedSleepAnalyticsWidget({super.key});

  static String routeName = 'DetailedSleepAnalytics';
  static String routePath = '/detailedSleepAnalytics';

  @override
  State<DetailedSleepAnalyticsWidget> createState() =>
      _DetailedSleepAnalyticsWidgetState();
}

class _DetailedSleepAnalyticsWidgetState
    extends State<DetailedSleepAnalyticsWidget> {
  late DetailedSleepAnalyticsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailedSleepAnalyticsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DetailedSleepAnalytics'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return RadialTurbulenceGradientShaderFill(
                  width: constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : 200.0,
                  height: constraints.maxHeight.isFinite
                      ? constraints.maxHeight
                      : 200.0,
                  params: ShaderParams(values: {
                    'gradientCenterX': 0.5,
                    'gradientCenterY': 0.2,
                    'gradientScale': 2.03,
                    'gradientOffset': -0.02,
                    'noiseIntensity': 0.51,
                    'ditherStrength': 0.0,
                    'ditherScale': 1.0,
                    'animSpeed': 0.75,
                    'octaves': 3.02,
                    'baseFrequency': 1.94,
                    'noiseScale': 3.9,
                    'colorCount': 3.0,
                    'softness': 1.0,
                    'exposure': 1.0,
                    'contrast': 1.0,
                    'bumpStrength': 1.68,
                    'lightDirX': 0.17,
                    'lightDirY': 0.5,
                    'lightDirZ': 1.0,
                    'lightIntensity': 1.62,
                    'ambient': 0.67,
                    'specular': 0.06,
                    'shininess': 35.72,
                    'metallic': 0.0,
                    'roughness': 1.0,
                    'edgeFade': 2.3,
                    'edgeFadeMode': 1.0
                  }, colors: {
                    'color0': Color(0x6639519F),
                    'color3': FlutterFlowTheme.of(context).secondaryBackground,
                    'color4': Color(0x00808080),
                    'color5': Color(0x00808080),
                    'color6': Color(0x00808080),
                    'color7': Color(0x00808080),
                    'color8': Color(0x00808080),
                    'color9': Color(0x00808080),
                    'color1': FlutterFlowTheme.of(context).tertiary,
                    'color2': FlutterFlowTheme.of(context).alternate
                  }),
                  animationMode: ShaderAnimationMode.continuous,
                  cache: false,
                );
              },
            ),
            SingleChildScrollView(
              controller: _model.columnScrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 16.0),
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 9999.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0x99FFFFFF),
                                      icon: Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'q970xq01' /* Sleep Analysis */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.cormorantSc(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 9999.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0x99FFFFFF),
                                      icon: Icon(
                                        Icons.calendar_month_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(32.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 20.0,
                                    sigmaY: 20.0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x66FFFFFF),
                                      borderRadius: BorderRadius.circular(32.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Color(0x99FFFFFF),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(32.0),
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                't6twnumz' /* Average Sleep */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.cormorantSc(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'cnm7mu5k' /* 7h 20m */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 40.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          25.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '8ajz5zpe' /* +12% */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .success,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                            Container(
                                              height: 200.0,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 40.0,
                                                        color:
                                                            Color(0xFFEDF1F7),
                                                        offset: Offset(
                                                          0.0,
                                                          0.0,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  child: Container(
                                                    height: 164.0,
                                                    child: FlutterFlowBarChart(
                                                      barData: [
                                                        FFBarChartData(
                                                          yData: ([
                                                            6.5,
                                                            7.2,
                                                            8.0,
                                                            6.8,
                                                            7.5,
                                                            8.2,
                                                            7.0
                                                          ]),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                              Color(0x83F0831A)
                                                            ],
                                                            begin: Alignment
                                                                .bottomCenter,
                                                            end: Alignment
                                                                .topCenter,
                                                          ),
                                                        )
                                                      ],
                                                      xLabels: ([
                                                        'M',
                                                        'T',
                                                        'W',
                                                        'T',
                                                        'F',
                                                        'S',
                                                        'S'
                                                      ]),
                                                      barWidth: 18.0,
                                                      barBorderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      groupSpace: 12.0,
                                                      alignment:
                                                          BarChartAlignment
                                                              .spaceAround,
                                                      chartStylingInfo:
                                                          ChartStylingInfo(
                                                        enableTooltip: true,
                                                        tooltipBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        showGrid: true,
                                                        gridColor:
                                                            Color(0x6339519F),
                                                        borderColor:
                                                            Color(0x3AEDF1F7),
                                                      ),
                                                      axisBounds: AxisBounds(
                                                        minY: 0.0,
                                                        maxX: 6.0,
                                                        maxY: 9.839999999999998,
                                                      ),
                                                      xAxisLabelInfo:
                                                          AxisLabelInfo(
                                                        showLabels: true,
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                        reservedSize: 20.0,
                                                      ),
                                                      yAxisLabelInfo:
                                                          AxisLabelInfo(
                                                        reservedSize: 0.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '9subflo2' /* Sleep Stages */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.cormorantSc(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(32.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 20.0,
                                      sigmaY: 20.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x66FFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0x99FFFFFF),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(32.0),
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              wrapWithModel(
                                                model:
                                                    _model.sleepStageRowModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: SleepStageRowWidget(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  duration: '1h 45m',
                                                  icon: Icon(
                                                    Icons.brightness_3_rounded,
                                                    size: 20.0,
                                                  ),
                                                  label: 'Deep Sleep',
                                                  progress: 0.25,
                                                ),
                                              ),
                                              wrapWithModel(
                                                model:
                                                    _model.sleepStageRowModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: SleepStageRowWidget(
                                                  color: Color(0xFF5C6BC0),
                                                  duration: '4h 15m',
                                                  icon: Icon(
                                                    Icons.nights_stay_rounded,
                                                    size: 20.0,
                                                  ),
                                                  label: 'Light Sleep',
                                                  progress: 0.6,
                                                ),
                                              ),
                                              wrapWithModel(
                                                model:
                                                    _model.sleepStageRowModel3,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: SleepStageRowWidget(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  duration: '1h 10m',
                                                  icon: Icon(
                                                    Icons.auto_awesome_rounded,
                                                    size: 20.0,
                                                  ),
                                                  label: 'REM',
                                                  progress: 0.15,
                                                ),
                                              ),
                                              wrapWithModel(
                                                model:
                                                    _model.sleepStageRowModel4,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: SleepStageRowWidget(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                  duration: '10m',
                                                  icon: Icon(
                                                    Icons.help,
                                                    size: 20.0,
                                                  ),
                                                  label: 'Awake',
                                                  progress: 0.05,
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 24.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10.0,
                                    sigmaY: 10.0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x1A39519F),
                                      borderRadius: BorderRadius.circular(24.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Color(0x3339519F),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(24.0),
                                      child: Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.lightbulb_rounded,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ukxe0qnz' /* Your deep sleep was 15% higher... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .workSans(
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
                                                          color: Colors.white,
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
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'hr8692fq' /* Keep up the routine! */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .workSans(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Container(
                              height: 86.4,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Logo_ESCAPE_White.png',
                                  width: 179.2,
                                  height: 236.8,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
