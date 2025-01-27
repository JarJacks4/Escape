import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/chat_item_view_widget.dart';
import '/components/empty_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'thread_screen_model.dart';
export 'thread_screen_model.dart';

class ThreadScreenWidget extends StatefulWidget {
  const ThreadScreenWidget({
    super.key,
    required this.collectionId,
    this.thread,
    this.question,
  });

  final int? collectionId;
  final HistoryItemsRecord? thread;
  final String? question;

  @override
  State<ThreadScreenWidget> createState() => _ThreadScreenWidgetState();
}

class _ThreadScreenWidgetState extends State<ThreadScreenWidget> {
  late ThreadScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ThreadScreen'});
    _model.promptTextController ??= TextEditingController();
    _model.promptFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 15.0,
                            buttonSize: 44.0,
                            fillColor: FlutterFlowTheme.of(context).alternate,
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'THREAD_SCREEN_close_rounded_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_navigate_back');
                              context.safePop();
                            },
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'hm6e3mnz' /* Lucille Agent Chat */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Flexible(
                            flex: 1,
                            child: Builder(
                              builder: (context) {
                                final chatItems = _model.chatData.toList();
                                if (chatItems.isEmpty) {
                                  return EmptyDataWidget();
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: chatItems.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 20.0),
                                  itemBuilder: (context, chatItemsIndex) {
                                    final chatItemsItem =
                                        chatItems[chatItemsIndex];
                                    return Container(
                                      height: 200.0,
                                      child: ChatItemViewWidget(
                                        key: Key(
                                            'Keyjng_${chatItemsIndex}_of_${chatItems.length}'),
                                        chat: chatItemsItem,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        if (_model.isLoading)
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    TextFormField(
                                      controller: _model.promptTextController,
                                      focusNode: _model.promptFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.promptTextController',
                                        Duration(milliseconds: 1),
                                        () async {
                                          logFirebaseEvent(
                                              'THREAD_SCREEN_prompt_ON_TEXTFIELD_CHANGE');
                                          logFirebaseEvent(
                                              'prompt_update_page_state');
                                          _model.hasValue =
                                              functions.checkValue('');
                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '1x90ueh2' /* Ask anything... */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'WorkSans',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                24.0, 20.0, 0.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      maxLines: 10,
                                      minLines: 1,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: _model
                                          .promptTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    if (_model.hasValue)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    functions.getVerticalSize(
                                                        MediaQuery.sizeOf(
                                                                context)
                                                            .height,
                                                        8.0),
                                                    0.0,
                                                  ),
                                                  8.0,
                                                  8.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'THREAD_SCREEN_PAGE_Icon_8uktmv4v_ON_TAP');
                                              if (functions.checkValue(_model
                                                  .promptTextController.text)) {
                                                logFirebaseEvent(
                                                    'Icon_update_page_state');
                                                _model.isLoading = true;
                                                _model.addToChatData(
                                                    ChatModelStruct(
                                                  question: _model
                                                      .promptTextController.text
                                                      .trim(),
                                                ));
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Icon_backend_call');
                                                _model.response =
                                                    await FastAPIGroup
                                                        .chatChatPostCall
                                                        .call();

                                                if ((_model
                                                        .response?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'Icon_backend_call');

                                                  var historyRecordReference =
                                                      HistoryRecord.collection
                                                          .doc(currentUserUid);
                                                  await historyRecordReference.set(
                                                      createHistoryRecordData());
                                                  _model.historyData = HistoryRecord
                                                      .getDocumentFromData(
                                                          createHistoryRecordData(),
                                                          historyRecordReference);
                                                  logFirebaseEvent(
                                                      'Icon_update_page_state');
                                                  _model.updateChatDataAtIndex(
                                                    functions.setLastIndex(
                                                        _model.chatData
                                                            .toList(),
                                                        1),
                                                    (_) => ChatModelStruct(
                                                      id: ChatModelStruct
                                                              .maybeFromMap((_model
                                                                      .response
                                                                      ?.jsonBody ??
                                                                  ''))
                                                          ?.id,
                                                      created: ChatModelStruct
                                                              .maybeFromMap((_model
                                                                      .response
                                                                      ?.jsonBody ??
                                                                  ''))
                                                          ?.created,
                                                      question: _model
                                                          .promptTextController
                                                          .text
                                                          .trim(),
                                                      answer: AnswerModelStruct
                                                              .maybeFromMap((_model
                                                                      .response
                                                                      ?.jsonBody ??
                                                                  ''))
                                                          ?.choices
                                                          ?.lastOrNull
                                                          ?.message
                                                          ?.content,
                                                    ),
                                                  );
                                                  logFirebaseEvent(
                                                      'Icon_backend_call');

                                                  await HistoryItemsRecord
                                                      .createDoc(
                                                    _model
                                                        .historyData!.reference,
                                                    id: widget!.collectionId!
                                                        .toString(),
                                                  ).set({
                                                    ...createHistoryItemsRecordData(
                                                      historyId:
                                                          widget!.collectionId,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'data':
                                                            getChatModelListFirestoreData(
                                                          _model.chatData,
                                                        ),
                                                      },
                                                    ),
                                                  });
                                                  logFirebaseEvent(
                                                      'Icon_clear_text_fields_pin_codes');
                                                  safeSetState(() {
                                                    _model.promptTextController
                                                        ?.clear();
                                                  });
                                                } else {
                                                  logFirebaseEvent(
                                                      'Icon_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Something went wrong!${(_model.response?.statusCode ?? 200).toString()}',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                  logFirebaseEvent(
                                                      'Icon_update_page_state');
                                                  _model.isLoading = false;
                                                  _model
                                                      .removeAtIndexFromChatData(
                                                          functions
                                                              .setLastIndex(
                                                                  _model
                                                                      .chatData
                                                                      .toList(),
                                                                  1));
                                                  safeSetState(() {});
                                                }

                                                logFirebaseEvent(
                                                    'Icon_update_page_state');
                                                _model.isLoading = false;
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.send_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 25.0,
                                            ),
                                          ),
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
            ],
          ),
        ),
      ),
    );
  }
}
