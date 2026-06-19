import '/components/mood_breakdown_item_widget.dart';
import '/components/pie_chart_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_palette/material_palette.dart';
import 'detailed_mood_breakdown_model.dart';
export 'detailed_mood_breakdown_model.dart';

class DetailedMoodBreakdownWidget extends StatefulWidget {
  const DetailedMoodBreakdownWidget({super.key});

  static String routeName = 'DetailedMoodBreakdown';
  static String routePath = '/detailedMoodBreakdown';

  @override
  State<DetailedMoodBreakdownWidget> createState() =>
      _DetailedMoodBreakdownWidgetState();
}

class _DetailedMoodBreakdownWidgetState
    extends State<DetailedMoodBreakdownWidget> {
  late DetailedMoodBreakdownModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailedMoodBreakdownModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DetailedMoodBreakdown'});
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
                return RadialFbmGradientShaderFill(
                  width: constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : 200.0,
                  height: constraints.maxHeight.isFinite
                      ? constraints.maxHeight
                      : 200.0,
                  params: ShaderParams(values: {
                    'gradientCenterX': 0.5,
                    'gradientCenterY': 0.2,
                    'gradientScale': 2.67,
                    'gradientOffset': -0.01,
                    'noiseIntensity': 0.43,
                    'ditherStrength': 0.0,
                    'ditherScale': 0.42,
                    'animSpeed': 0.42,
                    'octaves': 8.0,
                    'lacunarity': 2.16,
                    'persistence': 0.34,
                    'noiseScale': 2.93,
                    'colorCount': 4.0,
                    'softness': 0.82,
                    'exposure': 1.05,
                    'contrast': 1.16,
                    'bumpStrength': 1.6,
                    'lightDirX': 0.5,
                    'lightDirY': 0.06,
                    'lightDirZ': 0.79,
                    'lightIntensity': 1.06,
                    'ambient': 0.77,
                    'specular': 0.78,
                    'shininess': 101.49,
                    'metallic': 0.4,
                    'roughness': 0.4,
                    'edgeFade': 0.54,
                    'edgeFadeMode': 0.0
                  }, colors: {
                    'color0': FlutterFlowTheme.of(context).primary,
                    'color1': FlutterFlowTheme.of(context).secondary,
                    'color2': FlutterFlowTheme.of(context).primary,
                    'color3': Color(0x00808080),
                    'color4': Color(0x00808080),
                    'color5': Color(0x00808080),
                    'color6': Color(0x00808080),
                    'color7': Color(0x00808080),
                    'color8': Color(0x00808080),
                    'color9': Color(0x00808080)
                  }),
                  animationMode: ShaderAnimationMode.continuous,
                  cache: false,
                );
              },
            ),
            SingleChildScrollView(
              primary: false,
              controller: _model.columnScrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 80.0,
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Container(
                        child: Container(
                          height: 32.0,
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 22.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '0bhiuzo4' /* Mood Statistics */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.playfairDisplay(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  Icons.more_horiz_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 22.0,
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
                                color: Color(0x4DFFFFFF),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(32.0),
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 120.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                        borderRadius:
                                            BorderRadius.circular(9999.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '3m9n24ny' /* 😊 */,
                                        ),
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
                                              fontSize: 64.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'tj7ggmr0' /* Happy */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font: GoogleFonts.playfairDisplay(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '8ku2v9n7' /* Your dominant mood this week */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.workSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: Color(0xB3FFFFFF),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
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
                                color: Color(0x4DFFFFFF),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'wlp8dd2c' /* Mood Fluctuations */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.playfairDisplay(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    Container(
                                      height: 200.0,
                                      child: Container(
                                        height: 200.0,
                                        child: FlutterFlowBarChart(
                                          barData: [
                                            FFBarChartData(
                                              yData: ([
                                                60.0,
                                                45.0,
                                                80.0,
                                                55.0,
                                                90.0,
                                                70.0,
                                                65.0
                                              ]),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
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
                                          barWidth: 16.0,
                                          barBorderRadius:
                                              BorderRadius.circular(8.0),
                                          groupSpace: 12.0,
                                          alignment:
                                              BarChartAlignment.spaceEvenly,
                                          chartStylingInfo: ChartStylingInfo(
                                            backgroundColor: Colors.transparent,
                                            showBorder: false,
                                          ),
                                          axisBounds: AxisBounds(
                                            minY: 0.0,
                                            maxX: 6.0,
                                            maxY: 108.0,
                                          ),
                                          xAxisLabelInfo: AxisLabelInfo(
                                            showLabels: true,
                                            labelTextStyle:
                                                FlutterFlowTheme.of(context)
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 10.0,
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
                                                      lineHeight: 1.0,
                                                    ),
                                            reservedSize: 20.0,
                                          ),
                                          yAxisLabelInfo: AxisLabelInfo(
                                            reservedSize: 0.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 24.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
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
                                color: Color(0x4DFFFFFF),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'yor025ll' /* Mood Breakdown */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.playfairDisplay(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    wrapWithModel(
                                      model: _model.pieChartModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: PieChartWidget(
                                        data: '45,30,15,10',
                                        labels: 'Happy,Calm,Anxious,Sad',
                                        colors:
                                            '#fcc462,#39519f,#f0831a,#1c2444',
                                        centerValue: '',
                                        centerValuePresent: false,
                                        centerLabel: '',
                                        centerLabelPresent: false,
                                        animate: true,
                                        startAngle: -90.0,
                                        variant: 'donut',
                                        size: 'medium',
                                        legend: 'bottom',
                                        legendValue: 'percent',
                                        ring: 'medium',
                                        gap: 'normal',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          wrapWithModel(
                                            model:
                                                _model.moodBreakdownItemModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: MoodBreakdownItemWidget(
                                              color: Color(0xFFFCC462),
                                              dotId: 'd1',
                                              label: 'Happy',
                                              labelId: 'l1',
                                              rowId: 'm1',
                                              value: '45%',
                                              valueId: 'v1',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model:
                                                _model.moodBreakdownItemModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: MoodBreakdownItemWidget(
                                              color: Color(0xFF39519F),
                                              dotId: 'd1',
                                              label: 'Calm',
                                              labelId: 'l1',
                                              rowId: 'm1',
                                              value: '30%',
                                              valueId: 'v1',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model:
                                                _model.moodBreakdownItemModel3,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: MoodBreakdownItemWidget(
                                              color: Color(0xFFF0831A),
                                              dotId: 'd1',
                                              label: 'Anxious',
                                              labelId: 'l1',
                                              rowId: 'm1',
                                              value: '15%',
                                              valueId: 'v1',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model:
                                                _model.moodBreakdownItemModel4,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: MoodBreakdownItemWidget(
                                              color: Color(0xFF1C2444),
                                              dotId: 'd1',
                                              label: 'Sad',
                                              labelId: 'l1',
                                              rowId: 'm1',
                                              value: '10%',
                                              valueId: 'v1',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 24.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10.0,
                            sigmaY: 10.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x3339519F),
                              borderRadius: BorderRadius.circular(32.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0x4D39519F),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            FFLocalizations.of(context).getText(
                                              '4aki7vw0' /* Weekly Insight */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  font: GoogleFonts.workSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'mcg6s096' /* You tend to feel happiest on F... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts.workSans(
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
                                                  color: Color(0xCCFFFFFF),
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
                  Container(
                    height: 100.0,
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 25.0,
                    sigmaY: 25.0,
                  ),
                  child: Container(
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: Color(0x99FFFFFF),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Container(
                            child: Container(
                              height: 89.0,
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.home_rounded,
                                        color: Color(0x66FFFFFF),
                                        size: 24.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'xaj7urhg' /* Home */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.workSans(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                              color: Color(0x66FFFFFF),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.bar_chart_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '5okb8rv7' /* Stats */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.workSans(
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
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                  Container(
                                    width: 56.0,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius:
                                          BorderRadius.circular(9999.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.add_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 28.0,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.graphic_eq_rounded,
                                        color: Color(0x66FFFFFF),
                                        size: 24.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'psjs7s5l' /* Sound */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.workSans(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                              color: Color(0x66FFFFFF),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person_rounded,
                                        color: Color(0x66FFFFFF),
                                        size: 24.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'kbn58ybt' /* Profile */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.workSans(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                              color: Color(0x66FFFFFF),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                ],
                              ),
                            ),
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
