import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import '/custom_code/actions/index.dart' as actions;
import 'package:that_audio_player_5bjqer/app_state.dart'
    as that_audio_player_5bjqer_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:tiktokfeed_wz8en7/custom_code/widgets/index.dart'
    as tiktokfeed_wz8en7_custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'body_reorder_model.dart';
export 'body_reorder_model.dart';

class BodyReorderWidget extends StatefulWidget {
  const BodyReorderWidget({
    super.key,
    int? tabIndex,
  }) : this.tabIndex = tabIndex ?? 2;

  final int tabIndex;

  static String routeName = 'BodyReorder';
  static String routePath = 'bodyReorder';

  @override
  State<BodyReorderWidget> createState() => _BodyReorderWidgetState();
}

class _BodyReorderWidgetState extends State<BodyReorderWidget> {
  late BodyReorderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodyReorderModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'BodyReorder'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
    context.watch<that_audio_player_5bjqer_app_state.FFAppState>();

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
                        key: ValueKey("ListView_e2njd5fu" +
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
                                    .BodyTikToks,
                          ),
                        ),
                      );
                    },
                    onReorder: (int reorderableOldIndex,
                        int reorderableNewIndex) async {
                      logFirebaseEvent(
                          'BODY_REORDER_ListView_e2njd5fu_ON_REORDE');
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
                    logFirebaseEvent('BODY_REORDER_PAGE_BACK_BTN_ON_TAP');
                    logFirebaseEvent('Button_navigate_back');
                    context.safePop();
                  },
                  text: FFLocalizations.of(context).getText(
                    'g2kc2smi' /* Back */,
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
                      shadows: [
                        Shadow(
                          color: FlutterFlowTheme.of(context).secondary,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 5.0,
                        )
                      ],
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
