import '/auth/firebase_auth/auth_util.dart';
import '/components/influencer_ambassador_program_button_widget.dart';
import '/components/marketplace_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:tiktokfeed_wz8en7/custom_code/actions/index.dart'
    as tiktokfeed_wz8en7_actions;
import 'package:tiktokfeed_wz8en7/custom_code/widgets/index.dart'
    as tiktokfeed_wz8en7_custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'connection_community_start_page_version5_model.dart';
export 'connection_community_start_page_version5_model.dart';

class ConnectionCommunityStartPageVersion5Widget extends StatefulWidget {
  const ConnectionCommunityStartPageVersion5Widget({super.key});

  static String routeName = 'ConnectionCommunityStartPageVersion5';
  static String routePath = 'connectionCommunityStartPageVersion5';

  @override
  State<ConnectionCommunityStartPageVersion5Widget> createState() =>
      _ConnectionCommunityStartPageVersion5WidgetState();
}

class _ConnectionCommunityStartPageVersion5WidgetState
    extends State<ConnectionCommunityStartPageVersion5Widget>
    with TickerProviderStateMixin {
  late ConnectionCommunityStartPageVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => ConnectionCommunityStartPageVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ConnectionCommunityStartPageVersion5'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )
      ..addListener(() => safeSetState(() {}))
      ..addListener(() async {
        if (_model.tabBarController!.indexIsChanging) {
          return;
        }

        logFirebaseEvent('CONNECTION_COMMUNITY_START_VERSION5_TabB');
        logFirebaseEvent('TabBar_haptic_feedback');
        HapticFeedback.lightImpact();
        logFirebaseEvent('TabBar_play_sound');
        _model.soundPlayer ??= AudioPlayer();
        if (_model.soundPlayer!.playing) {
          await _model.soundPlayer!.stop();
        }
        _model.soundPlayer!.setVolume(0.68);
        _model.soundPlayer!
            .setAsset(
                'assets/audios/ES_Pops,_Wobble,_Bloop,_Pops_-_Epidemic_Sound.mp3')
            .then((_) => _model.soundPlayer!.play());

        logFirebaseEvent('TabBar_update_app_state');
        FFAppState().ReorderedVideosIndex =
            FFAppState().ReorderedVideosIndex + 1;
        safeSetState(() {});
        logFirebaseEvent('TabBar_custom_action');
        _model.reorderVideos =
            await tiktokfeed_wz8en7_actions.reorderTiktokPages(
          tiktokfeed_wz8en7_app_state.FFAppState().ListTikTokPages.toList(),
          _model.tabBarCurrentIndex,
          FFAppState().ReorderedVideosIndex,
        );
        logFirebaseEvent('TabBar_custom_action');
        _model.reorderBreathingVideos =
            await tiktokfeed_wz8en7_actions.reorderTiktokPages(
          tiktokfeed_wz8en7_app_state.FFAppState().meditationTikToks.toList(),
          tiktokfeed_wz8en7_app_state.FFAppState().meditationTikToks.length,
          tiktokfeed_wz8en7_app_state.FFAppState().meditationTikToks.length,
        );
        logFirebaseEvent('TabBar_custom_action');
        _model.reorderBody = await tiktokfeed_wz8en7_actions.reorderTiktokPages(
          tiktokfeed_wz8en7_app_state.FFAppState().BodyTikToks.toList(),
          tiktokfeed_wz8en7_app_state.FFAppState().BodyTikToks.firstOrNull!.id,
          tiktokfeed_wz8en7_app_state.FFAppState().meditationTikToks.length,
        );

        safeSetState(() {});
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
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<confetti_modualo_library_b75kfy_app_state.FFAppState>();
    context.watch<that_audio_player_oo85ab_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 875.09,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 874.61,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1).gif',
                            ).image,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xD2FFFFFF),
                                            Color(0xC3D0E3F7)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 50.0, 0.0, 0.0),
                                        child: Stack(
                                          children: [
                                            Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment(0.0, 0),
                                                  child: TabBar(
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    unselectedLabelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    labelPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .override(
                                                      fontFamily: 'WorkSans',
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      shadows: [
                                                        Shadow(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          offset:
                                                              Offset(15.0, 2.0),
                                                          blurRadius: 8.0,
                                                        )
                                                      ],
                                                    ),
                                                    unselectedLabelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  'WorkSans',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.5,
                                                            ),
                                                    indicatorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    indicatorWeight: 5.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(50.0, 0.0,
                                                                50.0, 0.0),
                                                    tabs: [
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'bs8kxrz1' /* For You */,
                                                        ),
                                                        iconMargin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'fj9969do' /* Breathing */,
                                                        ),
                                                        iconMargin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'a2ddepb8' /* Body */,
                                                        ),
                                                      ),
                                                    ],
                                                    controller:
                                                        _model.tabBarController,
                                                    onTap: (i) async {
                                                      [
                                                        () async {},
                                                        () async {},
                                                        () async {}
                                                      ][i]();
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    controller:
                                                        _model.tabBarController,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.82,
                                                            child:
                                                                tiktokfeed_wz8en7_custom_widgets
                                                                    .ChewieWidget(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.82,
                                                              userID:
                                                                  currentUserUid,
                                                              data: _model
                                                                  .reorderVideos!,
                                                              likerebuidpage:
                                                                  () async {},
                                                              bookedrebuidpage:
                                                                  () async {},
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.9,
                                                            child:
                                                                tiktokfeed_wz8en7_custom_widgets
                                                                    .ChewieWidget(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.9,
                                                              userID:
                                                                  currentUserUid,
                                                              data: _model
                                                                  .reorderBreathingVideos!,
                                                              likerebuidpage:
                                                                  () async {},
                                                              bookedrebuidpage:
                                                                  () async {},
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.9,
                                                            child:
                                                                tiktokfeed_wz8en7_custom_widgets
                                                                    .ChewieWidget(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.9,
                                                              userID:
                                                                  currentUserUid,
                                                              data: _model
                                                                  .reorderBody!,
                                                              likerebuidpage:
                                                                  () async {},
                                                              bookedrebuidpage:
                                                                  () async {},
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3.0, 0.0, 3.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .marketplaceButtonModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        MarketplaceButtonWidget(),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .influencerAmbassadorProgramButtonModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        InfluencerAmbassadorProgramButtonWidget(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
