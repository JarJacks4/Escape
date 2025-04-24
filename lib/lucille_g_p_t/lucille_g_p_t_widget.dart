import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lucille_g_p_t_model.dart';
export 'lucille_g_p_t_model.dart';

class LucilleGPTWidget extends StatefulWidget {
  const LucilleGPTWidget({super.key});

  static String routeName = 'LucilleGPT';
  static String routePath = 'lucilleGPT';

  @override
  State<LucilleGPTWidget> createState() => _LucilleGPTWidgetState();
}

class _LucilleGPTWidgetState extends State<LucilleGPTWidget> {
  late LucilleGPTModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LucilleGPTModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LucilleGPT'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/blur_bg@1x.png',
              ).image,
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 770.0,
              ),
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
                              Container(
                                width: 100.0,
                                height: 24.0,
                                decoration: BoxDecoration(),
                              ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 5.0,
                                      sigmaY: 4.0,
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final chat = _model.inputContent
                                                    .toList();

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: chat.length,
                                                  itemBuilder:
                                                      (context, chatIndex) {
                                                    final chatItem =
                                                        chat[chatIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          if ((int index) {
                                                            return index % 2 !=
                                                                0;
                                                          }(chatIndex))
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width >=
                                                                              1170.0) {
                                                                            return 700.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <=
                                                                              470.0) {
                                                                            return 330.0;
                                                                          } else {
                                                                            return 530.0;
                                                                          }
                                                                        }(),
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              1.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SelectionArea(
                                                                                child: AutoSizeText(
                                                                              chatIndex.toString(),
                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                    fontFamily: 'WorkSans',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            )),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'LUCILLE_G_P_T_PAGE_Row_viid4px5_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Row_copy_to_clipboard');
                                                                          await Clipboard.setData(ClipboardData(
                                                                              text: ChatWithLucilleCall.lucilleResponse(
                                                                            (_model.lucilleResponse?.jsonBody ??
                                                                                ''),
                                                                          )!));
                                                                          logFirebaseEvent(
                                                                              'Row_show_snack_bar');
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Response copied to clipboard.',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'WorkSans',
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 2000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.content_copy,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                size: 10.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'cuocyxqv' /* Copy response */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'WorkSans',
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          if (chatIndex % 2 ==
                                                              0)
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          1170.0) {
                                                                        return 700.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <=
                                                                          470.0) {
                                                                        return 330.0;
                                                                      } else {
                                                                        return 530.0;
                                                                      }
                                                                    }(),
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          (_model.lucilleResponse?.bodyText ??
                                                                              ''),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'WorkSans',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  controller:
                                                      _model.listViewController,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 32.0, 12.0, 12.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              1.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 4.0, 10.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: 300.0,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: true,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'wqlvbwix' /* Type something... */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 8,
                                  minLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    if (!isAndroid && !isiOS)
                                      TextInputFormatter.withFunction(
                                          (oldValue, newValue) {
                                        return TextEditingValue(
                                          selection: newValue.selection,
                                          text: newValue.text.toCapitalization(
                                              TextCapitalization.sentences),
                                        );
                                      }),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                fillColor: FlutterFlowTheme.of(context).accent1,
                                icon: Icon(
                                  Icons.send_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LUCILLE_G_P_T_send_rounded_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_update_page_state');
                                  _model.chatHistory = _model.chatHistory;
                                  safeSetState(() {});
                                  logFirebaseEvent('IconButton_backend_call');
                                  _model.lucilleResponse =
                                      await ChatWithLucilleCall.call(
                                    sessionId: FFAppState().chatSessionId,
                                    message: _model.inputContent
                                        .contains(_model.textController.text)
                                        .toString(),
                                  );

                                  if ((_model.lucilleResponse?.succeeded ??
                                      true)) {
                                    logFirebaseEvent(
                                        'IconButton_update_page_state');
                                    _model.chatHistory =
                                        (_model.lucilleResponse?.jsonBody ??
                                            '');
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'IconButton_clear_text_fields_pin_codes');
                                    safeSetState(() {
                                      _model.textController?.clear();
                                    });
                                  }
                                  logFirebaseEvent('IconButton_wait__delay');
                                  await Future.delayed(
                                      const Duration(milliseconds: 500));
                                  logFirebaseEvent('IconButton_scroll_to');
                                  await _model.listViewController?.animateTo(
                                    _model.listViewController!.position
                                        .maxScrollExtent,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );

                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Container(
                      width: 100.0,
                      height: 60.0,
                      decoration: BoxDecoration(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
