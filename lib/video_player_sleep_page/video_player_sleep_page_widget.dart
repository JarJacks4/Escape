import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:tiktokfeed_wz8en7/custom_code/widgets/index.dart'
    as tiktokfeed_wz8en7_custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_player_sleep_page_model.dart';
export 'video_player_sleep_page_model.dart';

/// ProviderCommunityHome
class VideoPlayerSleepPageWidget extends StatefulWidget {
  const VideoPlayerSleepPageWidget({
    super.key,
    this.urlVideo,
  });

  final String? urlVideo;

  static String routeName = 'VideoPlayerSleepPage';
  static String routePath = 'videoPlayerSleepPage';

  @override
  State<VideoPlayerSleepPageWidget> createState() =>
      _VideoPlayerSleepPageWidgetState();
}

class _VideoPlayerSleepPageWidgetState extends State<VideoPlayerSleepPageWidget>
    with TickerProviderStateMixin {
  late VideoPlayerSleepPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPlayerSleepPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VideoPlayerSleepPage'});
    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
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
        backgroundColor: Color(0x891C2444),
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).alternate,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 45.0, 8.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.transparent,
                                            Colors.transparent
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'VIDEO_PLAYER_SLEEP_Icon_9tbni4qv_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_navigate_back');
                                                context.safePop();
                                              },
                                              child: Icon(
                                                Icons.arrow_back_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'rnvrpt5r' /* Sleep */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'The Seasons',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 24.0)),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'VIDEO_PLAYER_SLEEP_Icon_qnzb0bne_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_navigate_to');

                                                context.pushNamed(
                                                  HomeVersion4Widget.routeName,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Icon(
                                                Icons.home,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                size: 28.0,
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
                        ),
                      ],
                    ),
                    background: Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                    titlePadding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                  ),
                  elevation: 0.0,
                ),
              )
            : null,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final forYouVideos =
                            tiktokfeed_wz8en7_app_state.FFAppState()
                                .BreathingTikTok
                                .toList();

                        return ReorderableListView.builder(
                          padding: EdgeInsets.zero,
                          proxyDecorator: (Widget child, int index,
                                  Animation<double> animation) =>
                              Material(color: Colors.transparent, child: child),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: forYouVideos.length,
                          itemBuilder: (context, forYouVideosIndex) {
                            final forYouVideosItem =
                                forYouVideos[forYouVideosIndex];
                            return Container(
                              key: ValueKey("ListView_v31nfxkj" +
                                  '_' +
                                  forYouVideosIndex.toString()),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 1.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.88,
                                      child: tiktokfeed_wz8en7_custom_widgets
                                          .ChewieWidget(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.88,
                                        userID: currentUserDisplayName,
                                        data: tiktokfeed_wz8en7_app_state
                                                .FFAppState()
                                            .meditationTikToks
                                            .take(100)
                                            .toList()
                                            .sortedList(
                                                keyOf: (e) => widget!.urlVideo!,
                                                desc: false)
                                            .where((e) =>
                                                FFAppState().moods != null &&
                                                FFAppState().moods != '')
                                            .toList()
                                            .unique((e) =>
                                                tiktokfeed_wz8en7_app_state
                                                        .FFAppState()
                                                    .BodyTikToks
                                                    .contains(
                                                        tiktokfeed_wz8en7_data_schema
                                                            .TiktokPageStruct(
                                                      likes: ['1'],
                                                    ))),
                                        likerebuidpage: () async {
                                          logFirebaseEvent(
                                              'VIDEO_PLAYER_SLEEP_Container_hf9numfv_CA');
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
                                              'VIDEO_PLAYER_SLEEP_Container_hf9numfv_CA');
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
                                ),
                              ),
                            );
                          },
                          onReorder: (int reorderableOldIndex,
                              int reorderableNewIndex) async {
                            logFirebaseEvent(
                                'VIDEO_PLAYER_SLEEP_ListView_v31nfxkj_ON_');
                            logFirebaseEvent('ListView_custom_action');
                            _model.updateSleep = await actions.reorderItems(
                              tiktokfeed_wz8en7_app_state.FFAppState()
                                  .BreathingTikTok
                                  .map((e) => e.urlvideo)
                                  .toList(),
                              reorderableOldIndex,
                              reorderableNewIndex,
                            );

                            safeSetState(() {});
                          },
                        ).animateOnPageLoad(
                            animationsMap['listViewOnPageLoadAnimation']!);
                      },
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
