import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'pilates_videos_comp_model.dart';
export 'pilates_videos_comp_model.dart';

class PilatesVideosCompWidget extends StatefulWidget {
  const PilatesVideosCompWidget({super.key});

  @override
  State<PilatesVideosCompWidget> createState() =>
      _PilatesVideosCompWidgetState();
}

class _PilatesVideosCompWidgetState extends State<PilatesVideosCompWidget>
    with TickerProviderStateMixin {
  late PilatesVideosCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PilatesVideosCompModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      height: double.infinity,
      decoration: BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        GradientText(
                          FFLocalizations.of(context).getText(
                            '4m9wro8n' /* New Pilates Videos */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w200,
                                  ),
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).secondary
                          ],
                          gradientDirection: GradientDirection.ltr,
                          gradientType: GradientType.linear,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 272.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: PagedListView<ApiPagingParams, dynamic>(
                                pagingController: _model.setListViewController1(
                                  (nextPageMarker) =>
                                      YouTubeDataPilatesAPIFINALCall.call(),
                                ),
                                padding: EdgeInsets.zero,
                                reverse: false,
                                scrollDirection: Axis.horizontal,
                                builderDelegate:
                                    PagedChildBuilderDelegate<dynamic>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),

                                  itemBuilder: (context, _, meditationsIndex) {
                                    final meditationsItem = _model
                                        .listViewPagingController1!
                                        .itemList![meditationsIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 187.0,
                                        height: 215.0,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PILATES_VIDEOS_Column_b6k8228t_ON_TAP');
                                            logFirebaseEvent(
                                                'Column_navigate_to');

                                            context.pushNamed(
                                              'youtubetestFINAL',
                                              queryParameters: {
                                                'videoid': serializeParam(
                                                  getJsonField(
                                                    meditationsItem,
                                                    r'''$.resource.videoid''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'description': serializeParam(
                                                  getJsonField(
                                                    meditationsItem,
                                                    r'''$.description''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'channelTitle': serializeParam(
                                                  getJsonField(
                                                    meditationsItem,
                                                    r'''$.channelTitle''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'videoTitle': serializeParam(
                                                  getJsonField(
                                                    meditationsItem,
                                                    r'''$.title''',
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
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 1.0, 0.0),
                                                child: Hero(
                                                  tag: getJsonField(
                                                    meditationsItem,
                                                    r'''$.thumbnails.default.url''',
                                                  ).toString(),
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.0),
                                                    child: Image.network(
                                                      getJsonField(
                                                        meditationsItem,
                                                        r'''$.thumbnails.default.url''',
                                                      ).toString(),
                                                      width: 272.0,
                                                      height: 100.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Text(
                                                    getJsonField(
                                                      meditationsItem,
                                                      r'''$.title''',
                                                    )
                                                        .toString()
                                                        .maybeHandleOverflow(
                                                          maxChars: 30,
                                                          replacement: '…',
                                                        ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(11.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        Color(0xFA000220),
                                                    icon: Icon(
                                                      Icons.play_circle,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'PILATES_VIDEOS_play_circle_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_navigate_to');

                                                      context.pushNamed(
                                                        'youtubetestFINAL',
                                                        queryParameters: {
                                                          'videoid':
                                                              serializeParam(
                                                            getJsonField(
                                                              meditationsItem,
                                                              r'''$.resourceid.videoid''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'description':
                                                              serializeParam(
                                                            getJsonField(
                                                              meditationsItem,
                                                              r'''$.description''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'channelTitle':
                                                              serializeParam(
                                                            getJsonField(
                                                              meditationsItem,
                                                              r'''$.channelTitle''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'videoTitle':
                                                              serializeParam(
                                                            getJsonField(
                                                              meditationsItem,
                                                              r'''$.title''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation1']!),
                                    );
                                  },
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
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientText(
                    FFLocalizations.of(context).getText(
                      'pzg1r4et' /* Recent Played */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                        ),
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).secondary
                    ],
                    gradientDirection: GradientDirection.ltr,
                    gradientType: GradientType.linear,
                  ),
                  Icon(
                    Icons.keyboard_control_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 219.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: PagedListView<ApiPagingParams, dynamic>(
                              pagingController: _model.setListViewController2(
                                (nextPageMarker) =>
                                    YouTubeDataPilatesAPIFINALCall.call(),
                              ),
                              padding: EdgeInsets.zero,
                              reverse: false,
                              scrollDirection: Axis.horizontal,
                              builderDelegate:
                                  PagedChildBuilderDelegate<dynamic>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
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

                                itemBuilder: (context, _, recentItemsIndex) {
                                  final recentItemsItem = _model
                                      .listViewPagingController2!
                                      .itemList![recentItemsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: 179.0,
                                      height: 137.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x50090F13),
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PILATES_VIDEOS_Column_ecuoujdc_ON_TAP');
                                          logFirebaseEvent(
                                              'Column_navigate_to');

                                          context.pushNamed(
                                            'youtubetestFINAL',
                                            queryParameters: {
                                              'videoid': serializeParam(
                                                getJsonField(
                                                  recentItemsItem,
                                                  r'''$.resource.videoid''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'description': serializeParam(
                                                getJsonField(
                                                  recentItemsItem,
                                                  r'''$.description''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'channelTitle': serializeParam(
                                                getJsonField(
                                                  recentItemsItem,
                                                  r'''$.channelTitle''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'videoTitle': serializeParam(
                                                getJsonField(
                                                  recentItemsItem,
                                                  r'''$.title''',
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
                                                    Duration(milliseconds: 2),
                                              ),
                                            },
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 1.0, 0.0),
                                              child: Hero(
                                                tag: getJsonField(
                                                  recentItemsItem,
                                                  r'''$.thumbnails.default.url''',
                                                ).toString(),
                                                transitionOnUserGestures: true,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0),
                                                  child: Image.network(
                                                    getJsonField(
                                                      recentItemsItem,
                                                      r'''$.thumbnails.default.url''',
                                                    ).toString(),
                                                    width: 215.0,
                                                    height: 130.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(15.0),
                                              child: Text(
                                                getJsonField(
                                                  recentItemsItem,
                                                  r'''$.title''',
                                                )
                                                    .toString()
                                                    .maybeHandleOverflow(
                                                      maxChars: 30,
                                                      replacement: '…',
                                                    ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation2']!),
                                  );
                                },
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
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientText(
                    FFLocalizations.of(context).getText(
                      '2nlxktff' /* Channels */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: Color(0xFF5B4090),
                          fontSize: 26.0,
                          letterSpacing: 0.0,
                        ),
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).secondary
                    ],
                    gradientDirection: GradientDirection.ltr,
                    gradientType: GradientType.linear,
                  ),
                  Icon(
                    Icons.keyboard_control_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 480.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  logFirebaseEvent(
                                      'PILATES_VIDEOS_ListView_2tij6tuw_ON_PULL');
                                  logFirebaseEvent(
                                      'ListView_refresh_database_request');
                                  safeSetState(() => _model
                                      .listViewPagingController3
                                      ?.refresh());
                                  await _model.waitForOnePageForListView3();
                                },
                                child: PagedListView<ApiPagingParams,
                                    dynamic>.separated(
                                  pagingController:
                                      _model.setListViewController3(
                                    (nextPageMarker) =>
                                        YouTubeDataPilatesAPIFINALCall.call(),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  shrinkWrap: true,
                                  reverse: false,
                                  scrollDirection: Axis.vertical,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 5.0),
                                  builderDelegate:
                                      PagedChildBuilderDelegate<dynamic>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    ),

                                    itemBuilder:
                                        (context, _, meditationsIndex) {
                                      final meditationsItem = _model
                                          .listViewPagingController3!
                                          .itemList![meditationsIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 187.0,
                                          height: 215.0,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'PILATES_VIDEOS_Column_arewv1d9_ON_TAP');
                                              logFirebaseEvent(
                                                  'Column_navigate_to');

                                              context.pushNamed(
                                                'youtubetestFINAL',
                                                queryParameters: {
                                                  'videoid': serializeParam(
                                                    getJsonField(
                                                      meditationsItem,
                                                      r'''$.resource.videoid''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'description': serializeParam(
                                                    getJsonField(
                                                      meditationsItem,
                                                      r'''$.description''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'channelTitle':
                                                      serializeParam(
                                                    getJsonField(
                                                      meditationsItem,
                                                      r'''$.channelTitle''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'videoTitle': serializeParam(
                                                    getJsonField(
                                                      meditationsItem,
                                                      r'''$.title''',
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
                                                    duration: Duration(
                                                        milliseconds: 3),
                                                  ),
                                                },
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 1.0, 0.0),
                                                  child: Hero(
                                                    tag: getJsonField(
                                                      meditationsItem,
                                                      r'''$.thumbnails.default.url''',
                                                    ).toString(),
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.0),
                                                      child: Image.network(
                                                        getJsonField(
                                                          meditationsItem,
                                                          r'''$.thumbnails.default.url''',
                                                        ).toString(),
                                                        width: 348.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                    child: Text(
                                                      getJsonField(
                                                        meditationsItem,
                                                        r'''$.title''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 30,
                                                            replacement: '…',
                                                          ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(11.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          Color(0xFA000220),
                                                      icon: Icon(
                                                        Icons.play_circle,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'PILATES_VIDEOS_play_circle_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_navigate_to');

                                                        context.pushNamed(
                                                          'youtubetestFINAL',
                                                          queryParameters: {
                                                            'videoid':
                                                                serializeParam(
                                                              getJsonField(
                                                                meditationsItem,
                                                                r'''$.resourceid.videoid''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'description':
                                                                serializeParam(
                                                              getJsonField(
                                                                meditationsItem,
                                                                r'''$.description''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'channelTitle':
                                                                serializeParam(
                                                              getJsonField(
                                                                meditationsItem,
                                                                r'''$.channelTitle''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'videoTitle':
                                                                serializeParam(
                                                              getJsonField(
                                                                meditationsItem,
                                                                r'''$.title''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      2),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation3']!),
                                      );
                                    },
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
            ),
          ],
        ),
      ),
    );
  }
}
