import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/flight_card_widget.dart';
import '/components/swipe_left_comp_widget.dart';
import '/components/test_card_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.dark);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'That Slideable Widget',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Builder(
                  builder: (context) => Container(
                    width: double.infinity,
                    height: 130.0,
                    child: custom_widgets.ThatSlideableWidget(
                      width: double.infinity,
                      height: 130.0,
                      startPaneFirstActionIcon: Icon(
                        Icons.share_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      endPaneFirstActionIcon: Icon(
                        Icons.delete_rounded,
                        color: FlutterFlowTheme.of(context).error,
                        size: 24.0,
                      ),
                      endPaneSecondActionIcon: null,
                      startPaneFirstActionStruct: SlideActionDataTypeStruct(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        flex: 1,
                        label: 'Share',
                        autoClose: false,
                        spacing: 4.0,
                        borderRadius: 12.0,
                      ),
                      endPaneFirstActionStruct: SlideActionDataTypeStruct(
                        backgroundColor: Color(0x40FF5963),
                        flex: 1,
                        label: 'delete',
                        autoClose: false,
                        spacing: 1.0,
                        borderRadius: 12.0,
                        foregroundColor: FlutterFlowTheme.of(context).error,
                      ),
                      endPaneSecondActionStruct: SlideActionDataTypeStruct(
                        backgroundColor: Color(0x40FF5963),
                        flex: 1,
                        label: 'delete',
                        autoClose: false,
                        spacing: 1.0,
                        borderRadius: 12.0,
                        foregroundColor: FlutterFlowTheme.of(context).error,
                      ),
                      startPaneDragDismissible: false,
                      endPaneDragDismissible: false,
                      startPaneMotion: ActionPaneMotion.drawer,
                      endPaneMotion: ActionPaneMotion.behind,
                      onStartActionPaneDismissed: () async {},
                      onEndActionPaneDismissed: () async {},
                      onStartPaneFirstActionPressed: () async {
                        await Share.share(
                          'Hello',
                          sharePositionOrigin: getWidgetBoundingBox(context),
                        );
                      },
                      onStartPaneSecondActionPressed: () async {},
                      onStartPaneThirdActionPressed: () async {},
                      onStartPaneFourthActionPressed: () async {},
                      onStartPaneFifthActionPressed: () async {},
                      onEndPaneFirstActionPressed: () async {
                        await launchURL('https://flutter.io');
                      },
                      onEndPaneSecondActionPressed: () async {},
                      onEndPaneThirdActionPressed: () async {},
                      onEndPaneFourthActionPressed: () async {},
                      onEndPaneFifthActionPressed: () async {},
                      child: () => TestCardComponentWidget(),
                    ),
                  ),
                ),
              ),
              Builder(
                builder: (context) => Container(
                  width: double.infinity,
                  height: 81.9,
                  child: custom_widgets.ThatSlideableWidget(
                    width: double.infinity,
                    height: 81.9,
                    startPaneFirstActionIcon: Icon(
                      Icons.share_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    startPaneSecondActionIcon: Icon(
                      Icons.favorite_border_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    startPaneThirdActionIcon: Icon(
                      Icons.report_problem_rounded,
                      color: FlutterFlowTheme.of(context).error,
                      size: 24.0,
                    ),
                    endPaneFirstActionIcon: Icon(
                      Icons.delete_rounded,
                      color: FlutterFlowTheme.of(context).error,
                      size: 24.0,
                    ),
                    endPaneSecondActionIcon: null,
                    startPaneFirstActionStruct: SlideActionDataTypeStruct(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      flex: 1,
                      label: '',
                      autoClose: false,
                      spacing: 4.0,
                      borderRadius: 12.0,
                    ),
                    endPaneFirstActionStruct: SlideActionDataTypeStruct(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      flex: 2,
                      label: '',
                      autoClose: false,
                      spacing: 1.0,
                      borderRadius: 12.0,
                      foregroundColor: FlutterFlowTheme.of(context).error,
                    ),
                    endPaneSecondActionStruct: SlideActionDataTypeStruct(
                      backgroundColor: Color(0x40FF5963),
                      flex: 1,
                      label: 'delete',
                      autoClose: false,
                      spacing: 1.0,
                      borderRadius: 12.0,
                      foregroundColor: FlutterFlowTheme.of(context).error,
                    ),
                    startPaneDragDismissible: false,
                    endPaneDragDismissible: false,
                    startPaneMotion: ActionPaneMotion.scroll,
                    endPaneMotion: ActionPaneMotion.behind,
                    startPaneSecondActionStruct: SlideActionDataTypeStruct(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      flex: 1,
                      label: '',
                      autoClose: false,
                      spacing: 4.0,
                      borderRadius: 12.0,
                    ),
                    startPaneThirdActionStruct: SlideActionDataTypeStruct(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      flex: 1,
                      label: '',
                      autoClose: false,
                      spacing: 4.0,
                      borderRadius: 12.0,
                    ),
                    onStartActionPaneDismissed: () async {},
                    onEndActionPaneDismissed: () async {},
                    onStartPaneFirstActionPressed: () async {
                      await Share.share(
                        'Hello',
                        sharePositionOrigin: getWidgetBoundingBox(context),
                      );
                    },
                    onStartPaneSecondActionPressed: () async {
                      await launchURL('https://flutter.io');
                    },
                    onStartPaneThirdActionPressed: () async {},
                    onStartPaneFourthActionPressed: () async {},
                    onStartPaneFifthActionPressed: () async {},
                    onEndPaneFirstActionPressed: () async {
                      await launchURL('https://flutter.io');
                    },
                    onEndPaneSecondActionPressed: () async {
                      Navigator.pop(context);
                    },
                    onEndPaneThirdActionPressed: () async {},
                    onEndPaneFourthActionPressed: () async {},
                    onEndPaneFifthActionPressed: () async {},
                    child: () => SwipeLeftCompWidget(),
                  ),
                ),
              ),
              Builder(
                builder: (context) => Container(
                  width: double.infinity,
                  height: 160.0,
                  child: custom_widgets.ThatSlideableWidget(
                    width: double.infinity,
                    height: 160.0,
                    startPaneFirstActionIcon: Icon(
                      Icons.share_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    endPaneFirstActionIcon: Icon(
                      Icons.delete_rounded,
                      color: FlutterFlowTheme.of(context).error,
                      size: 24.0,
                    ),
                    endPaneSecondActionIcon: null,
                    startPaneFirstActionStruct: SlideActionDataTypeStruct(
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      flex: 1,
                      label: 'Share',
                      autoClose: false,
                      spacing: 4.0,
                      borderRadius: 12.0,
                    ),
                    endPaneFirstActionStruct: SlideActionDataTypeStruct(
                      backgroundColor: Color(0x40FF5963),
                      flex: 2,
                      label: 'delete',
                      autoClose: false,
                      spacing: 1.0,
                      borderRadius: 12.0,
                      foregroundColor: FlutterFlowTheme.of(context).error,
                    ),
                    endPaneSecondActionStruct: SlideActionDataTypeStruct(
                      backgroundColor: Color(0x40FF5963),
                      flex: 1,
                      label: 'delete',
                      autoClose: false,
                      spacing: 1.0,
                      borderRadius: 12.0,
                      foregroundColor: FlutterFlowTheme.of(context).error,
                    ),
                    startPaneDragDismissible: false,
                    endPaneDragDismissible: false,
                    startPaneMotion: ActionPaneMotion.drawer,
                    endPaneMotion: ActionPaneMotion.behind,
                    onStartActionPaneDismissed: () async {},
                    onEndActionPaneDismissed: () async {},
                    onStartPaneFirstActionPressed: () async {
                      await Share.share(
                        'Hello',
                        sharePositionOrigin: getWidgetBoundingBox(context),
                      );
                    },
                    onStartPaneSecondActionPressed: () async {},
                    onStartPaneThirdActionPressed: () async {},
                    onStartPaneFourthActionPressed: () async {},
                    onStartPaneFifthActionPressed: () async {},
                    onEndPaneFirstActionPressed: () async {
                      await launchURL('https://flutter.io');
                    },
                    onEndPaneSecondActionPressed: () async {},
                    onEndPaneThirdActionPressed: () async {},
                    onEndPaneFourthActionPressed: () async {},
                    onEndPaneFifthActionPressed: () async {},
                    child: () => FlightCardWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
