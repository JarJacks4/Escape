import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_data_widget.dart';
import '/components/history_item_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lucille_chat_history_screen_model.dart';
export 'lucille_chat_history_screen_model.dart';

class LucilleChatHistoryScreenWidget extends StatefulWidget {
  const LucilleChatHistoryScreenWidget({super.key});

  @override
  State<LucilleChatHistoryScreenWidget> createState() =>
      _LucilleChatHistoryScreenWidgetState();
}

class _LucilleChatHistoryScreenWidgetState
    extends State<LucilleChatHistoryScreenWidget> {
  late LucilleChatHistoryScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LucilleChatHistoryScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LucilleChatHistoryScreen'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    width: 100.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Text(
                                'Hello,${currentUserDisplayName}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'The Seasons',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Logo_ESCAPE_DarkBlue.png',
                                width: MediaQuery.sizeOf(context).width * 0.352,
                                height: 156.0,
                                fit: BoxFit.contain,
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
            : null,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 56.0,
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/chatgpt_robot.png',
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '6m55ig6a' /* Lucille Chat Threads */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            functions.getVerticalSize(
                                MediaQuery.sizeOf(context).height, 16.0),
                            0.0,
                          ),
                          0.0,
                          0.0),
                      child: StreamBuilder<List<HistoryItemsRecord>>(
                        stream: queryHistoryItemsRecord(
                          parent: FFAppState().historyReference,
                          queryBuilder: (historyItemsRecord) =>
                              historyItemsRecord.orderBy('historyId',
                                  descending: true),
                        ),
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
                          List<HistoryItemsRecord>
                              listViewHistoryItemsRecordList = snapshot.data!;
                          if (listViewHistoryItemsRecordList.isEmpty) {
                            return EmptyDataWidget();
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewHistoryItemsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewHistoryItemsRecord =
                                  listViewHistoryItemsRecordList[listViewIndex];
                              return Container(
                                height: 200.0,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'LUCILLE_CHAT_HISTORY_SCREEN_Container_ja');
                                    logFirebaseEvent(
                                        'HistoryItemView_navigate_to');

                                    context.pushNamed(
                                      'ThreadScreen',
                                      queryParameters: {
                                        'collectionId': serializeParam(
                                          listViewHistoryItemsRecord
                                              .data.lastOrNull?.created,
                                          ParamType.int,
                                        ),
                                        'thread': serializeParam(
                                          listViewHistoryItemsRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'thread': listViewHistoryItemsRecord,
                                      },
                                    );
                                  },
                                  child: HistoryItemViewWidget(
                                    key: Key(
                                        'Keyjaa_${listViewIndex}_of_${listViewHistoryItemsRecordList.length}'),
                                    chat: listViewHistoryItemsRecord
                                        .data.lastOrNull!,
                                    chatDocument:
                                        listViewHistoryItemsRecord.reference,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
