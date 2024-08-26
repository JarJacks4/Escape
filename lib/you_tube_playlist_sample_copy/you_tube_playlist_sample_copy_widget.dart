import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'you_tube_playlist_sample_copy_model.dart';
export 'you_tube_playlist_sample_copy_model.dart';

class YouTubePlaylistSampleCopyWidget extends StatefulWidget {
  const YouTubePlaylistSampleCopyWidget({super.key});

  @override
  State<YouTubePlaylistSampleCopyWidget> createState() =>
      _YouTubePlaylistSampleCopyWidgetState();
}

class _YouTubePlaylistSampleCopyWidgetState
    extends State<YouTubePlaylistSampleCopyWidget> {
  late YouTubePlaylistSampleCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YouTubePlaylistSampleCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'YouTubePlaylistSampleCopy'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        buttonSize: 45.0,
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '6xqifqs0' /* YouTube Playlist */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<ApiCallResponse>(
                  future: FFAppState()
                      .increaseFocus(
                    requestFn: () => YouTubeDataAPIBinauralBeatsCall.call(
                      playlistId:
                          'PLyC3pcUWmqsS9kb5LkS1Thhut2hHwqYN5&si=vNC22ToUgnTdVFs-',
                      apiKey: 'AIzaSyB7aTJq3vp0n_4k4ct5d4Z0jOjjAeqSQis',
                      maxResults: '50',
                    ),
                  )
                      .then((result) {
                    _model.apiRequestCompleted = true;
                    return result;
                  }),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final listViewYouTubeDataAPIBinauralBeatsResponse =
                        snapshot.data!;

                    return Builder(
                      builder: (context) {
                        final items = getJsonField(
                          listViewYouTubeDataAPIBinauralBeatsResponse.jsonBody,
                          r'''$.items''',
                        ).toList();

                        return RefreshIndicator(
                          onRefresh: () async {
                            logFirebaseEvent(
                                'YOU_TUBE_PLAYLIST_SAMPLE_COPY_ListView_6');
                            logFirebaseEvent(
                                'ListView_refresh_database_request');
                            setState(() {
                              FFAppState().clearIncreaseFocusCache();
                              _model.apiRequestCompleted = false;
                            });
                            await _model.waitForApiRequestCompleted();
                          },
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: items.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, itemsIndex) {
                              final itemsItem = items[itemsIndex];
                              return Stack(
                                children: [
                                  Hero(
                                    tag: getJsonField(
                                      listViewYouTubeDataAPIBinauralBeatsResponse
                                          .jsonBody,
                                      r'''$.items[:].snippet.thumbnails.default''',
                                    ).toString(),
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                      child: Image.network(
                                        getJsonField(
                                          listViewYouTubeDataAPIBinauralBeatsResponse
                                              .jsonBody,
                                          r'''$.items[:].snippet.thumbnails.default''',
                                        ).toString(),
                                        width: 120.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 70.0, 15.0, 0.0),
                                      child: Container(
                                        width: 32.0,
                                        height: 32.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x230E151B),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'YOU_TUBE_PLAYLIST_SAMPLE_COPY_Icon_h3q65');
                                            logFirebaseEvent(
                                                'Icon_navigate_to');

                                            context.pushNamed(
                                              'VideoPlayer',
                                              queryParameters: {
                                                'videoId': serializeParam(
                                                  getJsonField(
                                                    listViewYouTubeDataAPIBinauralBeatsResponse
                                                        .jsonBody,
                                                    r'''$.items[:].snippet.resourceId.videoId''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 3),
                                                ),
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.play_arrow_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        130.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getJsonField(
                                            listViewYouTubeDataAPIBinauralBeatsResponse
                                                .jsonBody,
                                            r'''$.items[:].snippet.title''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 4.0),
                                          child: Text(
                                            getJsonField(
                                              listViewYouTubeDataAPIBinauralBeatsResponse
                                                  .jsonBody,
                                              r'''$.items[:].snippet.channelTitle''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              getJsonField(
                                                listViewYouTubeDataAPIBinauralBeatsResponse
                                                    .jsonBody,
                                                r'''$.items[:].snippet.videoOwnerChannelTitle''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
