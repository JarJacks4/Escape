import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/meditation_and_sounds/music_player_comp/music_player_comp_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'binauralbeats_details_model.dart';
export 'binauralbeats_details_model.dart';

class BinauralbeatsDetailsWidget extends StatefulWidget {
  const BinauralbeatsDetailsWidget({
    super.key,
    required this.details,
  });

  final Future Function()? details;

  @override
  State<BinauralbeatsDetailsWidget> createState() =>
      _BinauralbeatsDetailsWidgetState();
}

class _BinauralbeatsDetailsWidgetState
    extends State<BinauralbeatsDetailsWidget> {
  late BinauralbeatsDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BinauralbeatsDetailsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 692.0,
      decoration: BoxDecoration(),
      child: PagedListView<ApiPagingParams, dynamic>(
        pagingController: _model.setListViewController(
          (nextPageMarker) => YouTubeDataAPIBinauralBeatsCall.call(
            playlistId: 'PLyC3pcUWmqsTalfauEnixmkhUeV7g9TdU',
            apiKey: 'AIzaSyB7aTJq3vp0n_4k4ct5d4Z0jOjjAeqSQis',
            maxResults: '50',
          ),
        ),
        padding: EdgeInsets.zero,
        primary: false,
        shrinkWrap: true,
        reverse: false,
        scrollDirection: Axis.vertical,
        builderDelegate: PagedChildBuilderDelegate<dynamic>(
          // Customize what your widget looks like when it's loading the first page.
          firstPageProgressIndicatorBuilder: (_) => Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          ),
          // Customize what your widget looks like when it's loading another page.
          newPageProgressIndicatorBuilder: (_) => Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          ),

          itemBuilder: (context, _, binauralBeatsItemsIndex) {
            final binauralBeatsItemsItem = _model
                .listViewPagingController!.itemList![binauralBeatsItemsIndex];
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 10.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.048,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x25000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Hero(
                      tag: getJsonField(
                        binauralBeatsItemsItem,
                        r'''$.snippetThumbnailsDefault''',
                      ).toString(),
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(0.0),
                        ),
                        child: Image.network(
                          getJsonField(
                            binauralBeatsItemsItem,
                            r'''$.snippetThumbnailsDefault''',
                          ).toString(),
                          width: 112.0,
                          height: 112.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 8.0),
                      child: Container(
                        width: 4.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF4B39EF),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 16.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getJsonField(
                              binauralBeatsItemsItem,
                              r'''$.snippet.title''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF101213),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              getJsonField(
                                binauralBeatsItemsItem,
                                r'''$.snippet.channelTitle''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'BINAURALBEATS_DETAILS_Text_r8rysnlq_ON_T');
                                logFirebaseEvent('Text_navigate_to');

                                context.pushNamed(
                                  'VideoPlayer',
                                  queryParameters: {
                                    'videoId': serializeParam(
                                      getJsonField(
                                        binauralBeatsItemsItem,
                                        r'''$.items[:].snippet.resourceId.videoId''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 3),
                                    ),
                                  },
                                );
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'qf7r0tbz' /* Click Here to Play */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF4B39EF),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: Icon(
                              Icons.play_circle_outline_rounded,
                              color: Color(0xF3E00B67),
                              size: 30.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BINAURALBEATS_DETAILS_play_circle_outlin');
                              logFirebaseEvent('IconButton_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Color(0x00000000),
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height: double.infinity,
                                        child: MusicPlayerCompWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
