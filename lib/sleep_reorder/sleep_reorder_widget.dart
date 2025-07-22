import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:chat_u_i_kit_n2m29m/app_state.dart'
    as chat_u_i_kit_n2m29m_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:tiktokfeed_wz8en7/custom_code/widgets/index.dart'
    as tiktokfeed_wz8en7_custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'sleep_reorder_model.dart';
export 'sleep_reorder_model.dart';

class SleepReorderWidget extends StatefulWidget {
  const SleepReorderWidget({super.key});

  static String routeName = 'SleepReorder';
  static String routePath = '/sleepReorder';

  @override
  State<SleepReorderWidget> createState() => _SleepReorderWidgetState();
}

class _SleepReorderWidgetState extends State<SleepReorderWidget>
    with TickerProviderStateMixin {
  late SleepReorderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SleepReorderModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SleepReorder'});
    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
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
    context.watch<chat_u_i_kit_n2m29m_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
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
                                8.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'enpykbka' /* Sleep */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'The Seasons',
                                        color: Colors.black,
                                        fontSize: 32.0,
                                        letterSpacing: 0.0,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation']!),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SLEEP_REORDER_PAGE_Image_dg6trx3p_ON_TAP');
                                        logFirebaseEvent('Image_navigate_to');

                                        context.pushNamed(
                                            HomeVersion4Widget.routeName);
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Rectangle_1.png',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'imageOnPageLoadAnimation']!),
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
                        color: FlutterFlowTheme.of(context).primary,
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
          children: [
            Flexible(
              flex: 1,
              child: Builder(
                builder: (context) {
                  final meditations = tiktokfeed_wz8en7_app_state.FFAppState()
                      .meditationTikToks
                      .toList();

                  return ReorderableListView.builder(
                    padding: EdgeInsets.zero,
                    proxyDecorator: (Widget child, int index,
                            Animation<double> animation) =>
                        Material(color: Colors.transparent, child: child),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: meditations.length,
                    itemBuilder: (context, meditationsIndex) {
                      final meditationsItem = meditations[meditationsIndex];
                      return Container(
                        key: ValueKey("ListView_8s8eydbs" +
                            '_' +
                            meditationsIndex.toString()),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.85,
                          child: tiktokfeed_wz8en7_custom_widgets
                              .TikTokVideoPlayerWidget(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.85,
                            tiktokVideosData:
                                tiktokfeed_wz8en7_app_state.FFAppState()
                                    .BreathingTikTok,
                          ),
                        ),
                      );
                    },
                    onReorder: (int reorderableOldIndex,
                        int reorderableNewIndex) async {
                      logFirebaseEvent(
                          'SLEEP_REORDER_ListView_8s8eydbs_ON_REORD');
                      logFirebaseEvent('ListView_custom_action');
                      _model.reorderMeditation = await actions.reorderItems(
                        tiktokfeed_wz8en7_app_state.FFAppState()
                            .meditationTikToks
                            .map((e) => e.urlvideo)
                            .toList()
                            .take(100)
                            .toList(),
                        reorderableOldIndex,
                        reorderableNewIndex,
                      );
                      logFirebaseEvent('ListView_update_app_state');
                      tiktokfeed_wz8en7_app_state.FFAppState()
                              .meditationTikToks =
                          tiktokfeed_wz8en7_app_state.FFAppState()
                              .meditationTikToks
                              .toList()
                              .cast<
                                  tiktokfeed_wz8en7_data_schema
                                  .TiktokPageStruct>();
                      safeSetState(() {});

                      safeSetState(() {});
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 59.8,
                decoration: BoxDecoration(),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('SLEEP_REORDER_PAGE_BACK_BTN_ON_TAP');
                    logFirebaseEvent('Button_navigate_back');
                    context.safePop();
                  },
                  text: FFLocalizations.of(context).getText(
                    'nlvxcz4l' /* Back */,
                  ),
                  options: FFButtonOptions(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).accent1,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'WorkSans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
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
