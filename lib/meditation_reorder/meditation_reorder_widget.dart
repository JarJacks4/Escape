import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/custom_code/actions/index.dart' as actions;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:tiktokfeed_wz8en7/custom_code/widgets/index.dart'
    as tiktokfeed_wz8en7_custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'meditation_reorder_model.dart';
export 'meditation_reorder_model.dart';

class MeditationReorderWidget extends StatefulWidget {
  const MeditationReorderWidget({
    super.key,
    int? tabIndex,
  }) : this.tabIndex = tabIndex ?? 2;

  final int tabIndex;

  static String routeName = 'MeditationReorder';
  static String routePath = 'meditationReorder';

  @override
  State<MeditationReorderWidget> createState() =>
      _MeditationReorderWidgetState();
}

class _MeditationReorderWidgetState extends State<MeditationReorderWidget> {
  late MeditationReorderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationReorderModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MeditationReorder'});
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: Builder(
                  builder: (context) {
                    final meditations = tiktokfeed_wz8en7_app_state.FFAppState()
                        .meditationTikToks
                        .where((e) => widget.tabIndex > 1)
                        .toList();

                    return ReorderableListView.builder(
                      padding: EdgeInsets.zero,
                      reverse: true,
                      proxyDecorator: (Widget child, int index,
                              Animation<double> animation) =>
                          Material(color: Colors.transparent, child: child),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: meditations.length,
                      itemBuilder: (context, meditationsIndex) {
                        final meditationsItem = meditations[meditationsIndex];
                        return Container(
                          key: ValueKey("ListView_g08lk0zh" +
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
                                      .meditationTikToks,
                            ),
                          ),
                        );
                      },
                      onReorder: (int reorderableOldIndex,
                          int reorderableNewIndex) async {
                        logFirebaseEvent(
                            'MEDITATION_REORDER_ListView_g08lk0zh_ON_');
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
                        tiktokfeed_wz8en7_app_state.FFAppState().update(() {});

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
                      logFirebaseEvent(
                          'MEDITATION_REORDER_PAGE_BACK_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_back');
                      context.safePop();
                    },
                    text: FFLocalizations.of(context).getText(
                      'yai1fxhr' /* Back */,
                    ),
                    options: FFButtonOptions(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).accent1,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
      ),
    );
  }
}
