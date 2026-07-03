import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/components/calendar_day_widget.dart';
import '/components/journal_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:material_palette/material_palette.dart';
import 'journal_history_model.dart';
export 'journal_history_model.dart';

class JournalHistoryWidget extends StatefulWidget {
  const JournalHistoryWidget({super.key});

  static String routeName = 'JournalHistory';
  static String routePath = '/journalHistory';

  @override
  State<JournalHistoryWidget> createState() => _JournalHistoryWidgetState();
}

class _JournalHistoryWidgetState extends State<JournalHistoryWidget> {
  late JournalHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalHistoryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'JournalHistory'});
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
                return RadialGrittyGradientShaderFill(
                  width: constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : 200.0,
                  height: constraints.maxHeight.isFinite
                      ? constraints.maxHeight
                      : 200.0,
                  params: ShaderParams(values: {
                    'gradientCenterX': 0.17,
                    'gradientCenterY': 0.03,
                    'gradientScale': 1.29,
                    'gradientOffset': -0.32,
                    'noiseDensity': 800.0,
                    'ditherStrength': 0.0,
                    'ditherScale': 0.95,
                    'colorCount': 3.0,
                    'softness': 1.0,
                    'exposure': 1.0,
                    'contrast': 1.0,
                    'stippleStrength': 0.21,
                    'noiseIntensity': 0.66,
                    'animSpeed': 0.04
                  }, colors: {
                    'color0': Color(0xFFFFE6B4),
                    'color1': Color(0xFFE68C78),
                    'color2': Color(0xFF64508C),
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
                                  24.0, 60.0, 24.0, 20.0),
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '6739yzs1' /* My Journals */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                font:
                                                    GoogleFonts.playfairDisplay(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
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
                                            '0i038okm' /* Reflecting on your journey */,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
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
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                    Container(
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x99FFFFFF),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 200.0,
                                          height: 200.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            currentUserPhoto,
                                            fit: BoxFit.cover,
                                          ),
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 24.0),
                              child: Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: _model.rowScrollController,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      wrapWithModel(
                                        model: _model.calendarDayModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CalendarDayWidget(
                                          day: '21',
                                          isToday: false,
                                          status: 'none',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.calendarDayModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CalendarDayWidget(
                                          day: '22',
                                          isToday: false,
                                          status: 'none',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.calendarDayModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CalendarDayWidget(
                                          day: '23',
                                          isToday: false,
                                          status: 'none',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.calendarDayModel4,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CalendarDayWidget(
                                          day: '24',
                                          isToday: true,
                                          status: 'none',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.calendarDayModel5,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CalendarDayWidget(
                                          day: '25',
                                          isToday: false,
                                          status: 'none',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.calendarDayModel6,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CalendarDayWidget(
                                          day: '26',
                                          isToday: false,
                                          status: 'none',
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'qv0viv4r' /* Recent Entries */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.playfairDisplay(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      wrapWithModel(
                                        model: _model.buttonModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ButtonWidget(
                                          content: 'Newest',
                                          iconPresent: false,
                                          iconEnd: Icon(
                                            Icons.expand_more_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 16.0,
                                          ),
                                          iconEndPresent: true,
                                          variant: 'ghost',
                                          size: 'medium',
                                          fullWidth: false,
                                          loading: false,
                                          disabled: false,
                                          icon: Icon(
                                            Icons.filter_list,
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                AuthUserStreamWidget(
                                  builder: (context) => PagedListView<
                                      DocumentSnapshot<Object?>?,
                                      JournalRecord>(
                                    pagingController:
                                        _model.setListViewController(
                                      JournalRecord.collection().where(
                                        'JournalContent',
                                        isEqualTo: valueOrDefault(
                                            currentUserDocument?.currentMood,
                                            ''),
                                      ),
                                    ),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    reverse: false,
                                    scrollDirection: Axis.vertical,
                                    builderDelegate: PagedChildBuilderDelegate<
                                        JournalRecord>(
                                      // Customize what your widget looks like when it's loading the first page.
                                      firstPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 100.0,
                                          height: 100.0,
                                          child: SpinKitWave(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            size: 100.0,
                                          ),
                                        ),
                                      ),
                                      // Customize what your widget looks like when it's loading another page.
                                      newPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 100.0,
                                          height: 100.0,
                                          child: SpinKitWave(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            size: 100.0,
                                          ),
                                        ),
                                      ),

                                      itemBuilder: (context, _, listViewIndex) {
                                        final listViewJournalRecord = _model
                                            .listViewPagingController!
                                            .itemList![listViewIndex];
                                        return JournalCardWidget(
                                          key: Key(
                                              'Keydz0_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                          date: dateTimeFormat(
                                            "MMMMEEEEd",
                                            listViewJournalRecord.timestamp,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          hasVoice: true,
                                          moodBg: FlutterFlowTheme.of(context)
                                              .secondary,
                                          moodColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          moodIcon: Icon(
                                            Icons
                                                .sentiment_satisfied_alt_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                          snippet:
                                              'Had a great morning meditation session and feeling energized for the day ahead. The sun is out and I feel like I can conquer anything...',
                                          title: 'Feeling Positive Today!',
                                          trigger: 'Morning Meditation',
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 1.0),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Container(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      print('FAB pressed ...');
                    },
                    backgroundColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.add_rounded,
                      color: FlutterFlowTheme.of(context).alternate,
                      size: 24.0,
                    ),
                    elevation: 8.0,
                    autofocus: true,
                    label: Text(
                      FFLocalizations.of(context).getText(
                        '2n2l7b6k' /* Write Entry */,
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontStyle,
                            ),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                          ),
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
