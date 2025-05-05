import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/index.dart';
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:tiktokfeed_wz8en7/custom_code/widgets/index.dart'
    as tiktokfeed_wz8en7_custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_home_model.dart';
export 'community_home_model.dart';

/// ProviderCommunityHome
class CommunityHomeWidget extends StatefulWidget {
  const CommunityHomeWidget({super.key});

  static String routeName = 'CommunityHome';
  static String routePath = 'communityHome';

  @override
  State<CommunityHomeWidget> createState() => _CommunityHomeWidgetState();
}

class _CommunityHomeWidgetState extends State<CommunityHomeWidget>
    with TickerProviderStateMixin {
  late CommunityHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityHomeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CommunityHome'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 1,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            if (responsiveVisibility(
              context: context,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              SliverAppBar(
                pinned: false,
                floating: true,
                snap: false,
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    width: double.infinity,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => AutoSizeText(
                                'Hello, ${currentUserDisplayName}'
                                    .maybeHandleOverflow(
                                  maxChars: 10,
                                  replacement: '…',
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'The Seasons',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                120.0, 0.0, 8.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'COMMUNITY_HOME_Image_iuqgedp4_ON_TAP');
                                logFirebaseEvent('Image_navigate_to');

                                context.pushNamed(HomeVersion2Widget.routeName);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Logo_ESCAPE_DarkBlue.png',
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  height: 300.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                elevation: 0.0,
              )
          ],
          body: Builder(
            builder: (context) {
              return Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                unselectedLabelColor: Color(0x6A39519F),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'The Seasons',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          letterSpacing: 0.0,
                                        ),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).alternate,
                                padding: EdgeInsets.all(10.0),
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'lht2hisr' /* Breathing */,
                                    ),
                                    icon: FaIcon(
                                      FontAwesomeIcons.wind,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'de3l73ap' /* Feed */,
                                    ),
                                    icon: Icon(
                                      Icons.rss_feed_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      size: 36.0,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'zb562e73' /* Body */,
                                    ),
                                    icon: Icon(
                                      FFIcons.khealthcare1,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      size: 36.0,
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child:
                                                tiktokfeed_wz8en7_custom_widgets
                                                    .ChewieWidget(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              userID: 'userId',
                                              data: tiktokfeed_wz8en7_app_state
                                                      .FFAppState()
                                                  .BreathingTikTok
                                                  .take(10)
                                                  .toList(),
                                              likerebuidpage: () async {},
                                              bookedrebuidpage: () async {},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child:
                                                tiktokfeed_wz8en7_custom_widgets
                                                    .ChewieWidget(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              userID: 'userId',
                                              data: tiktokfeed_wz8en7_app_state
                                                      .FFAppState()
                                                  .ListTikTokPages
                                                  .take(10)
                                                  .toList(),
                                              likerebuidpage: () async {
                                                logFirebaseEvent(
                                                    'COMMUNITY_HOME_Container_1noo1x6w_CALLBA');
                                                logFirebaseEvent(
                                                    'ChewieWidget_update_app_state');
                                                FFAppState()
                                                    .updateListTikTokPagesAtIndex(
                                                  FFAppState().videoId,
                                                  (e) => e
                                                    ..likes = FFAppState()
                                                        .newListLike
                                                        .toList(),
                                                );
                                                safeSetState(() {});
                                              },
                                              bookedrebuidpage: () async {
                                                logFirebaseEvent(
                                                    'COMMUNITY_HOME_Container_1noo1x6w_CALLBA');
                                                logFirebaseEvent(
                                                    'ChewieWidget_update_app_state');
                                                FFAppState()
                                                    .updateListTikTokPagesAtIndex(
                                                  FFAppState().videoId,
                                                  (e) => e
                                                    ..bookmark = FFAppState()
                                                        .newListBookmarks
                                                        .toList(),
                                                );
                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child:
                                                tiktokfeed_wz8en7_custom_widgets
                                                    .ChewieWidget(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              userID: 'userId',
                                              data: tiktokfeed_wz8en7_app_state
                                                      .FFAppState()
                                                  .BodyTikToks
                                                  .take(10)
                                                  .toList(),
                                              likerebuidpage: () async {
                                                logFirebaseEvent(
                                                    'COMMUNITY_HOME_Container_ar0l0odn_CALLBA');
                                                logFirebaseEvent(
                                                    'ChewieWidget_update_app_state');
                                                FFAppState()
                                                    .updateListTikTokPagesAtIndex(
                                                  FFAppState().videoId,
                                                  (e) => e
                                                    ..likes = FFAppState()
                                                        .newListLike
                                                        .toList(),
                                                );
                                                safeSetState(() {});
                                              },
                                              bookedrebuidpage: () async {
                                                logFirebaseEvent(
                                                    'COMMUNITY_HOME_Container_ar0l0odn_CALLBA');
                                                logFirebaseEvent(
                                                    'ChewieWidget_update_app_state');
                                                FFAppState()
                                                    .updateListTikTokPagesAtIndex(
                                                  FFAppState().videoId,
                                                  (e) => e
                                                    ..bookmark = FFAppState()
                                                        .newListBookmarks
                                                        .toList(),
                                                );
                                                safeSetState(() {});
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
