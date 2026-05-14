import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'voice_chat_lucille_model.dart';
export 'voice_chat_lucille_model.dart';

class VoiceChatLucilleWidget extends StatefulWidget {
  const VoiceChatLucilleWidget({super.key});

  static String routeName = 'VoiceChatLucille';
  static String routePath = 'voiceChatLucille';

  @override
  State<VoiceChatLucilleWidget> createState() => _VoiceChatLucilleWidgetState();
}

class _VoiceChatLucilleWidgetState extends State<VoiceChatLucilleWidget> {
  late VoiceChatLucilleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoiceChatLucilleModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VoiceChatLucille'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VOICE_CHAT_LUCILLE_VoiceChatLucille_ON_I');
      logFirebaseEvent('VoiceChatLucille_request_permissions');
      await requestPermission(microphonePermission);
    });

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
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 874.7,
                  decoration: BoxDecoration(),
                  child: FlutterFlowWebView(
                    content:
                        '<!DOCTYPE html>\n<html>\n<head>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<style>\n  * { box-sizing: border-box; margin: 0; padding: 0; }\n  \n  body {\n    background: transparent;\n    font-family: \'DM Sans\', sans-serif;\n  }\n\n  /* Pixel Streaming fills the whole screen */\n  #player-container {\n    position: fixed;\n    inset: 0;\n    z-index: 1;\n  }\n\n  /* Chat overlay sits on top */\n  #chat-overlay {\n    position: fixed;\n    bottom: 24px;\n    left: 16px;\n    right: 16px;\n    display: flex;\n    gap: 8px;\n    z-index: 9999;\n  }\n\n  #lucille-input {\n    flex: 1;\n    padding: 12px 16px;\n    border-radius: 24px;\n    border: 1px solid rgba(127, 119, 221, 0.4);\n    background: rgba(13, 13, 20, 0.88);\n    color: #EEEDF8;\n    font-size: 14px;\n    outline: none;\n    -webkit-appearance: none;\n  }\n\n  #lucille-input::placeholder {\n    color: rgba(255,255,255,0.3);\n  }\n\n  #send-btn {\n    padding: 12px 20px;\n    border-radius: 24px;\n    background: #7F77DD;\n    color: white;\n    border: none;\n    font-size: 14px;\n    font-weight: 500;\n    cursor: pointer;\n    white-space: nowrap;\n    -webkit-tap-highlight-color: transparent;\n  }\n\n  #send-btn:active {\n    background: #534AB7;\n  }\n\n  #status {\n    position: fixed;\n    top: 20px;\n    left: 50%;\n    transform: translateX(-50%);\n    font-size: 11px;\n    color: rgba(255,255,255,0.4);\n    z-index: 9999;\n    font-family: monospace;\n  }\n</style>\n</head>\n<body>\n\n<!-- Pixel Streaming loads here -->\n<div id=\"player-container\"></div>\n\n<!-- Status indicator -->\n<div id=\"status\">Connecting to Lucille...</div>\n\n<!-- Chat input overlay -->\n<div id=\"chat-overlay\">\n  <input\n    id=\"lucille-input\"\n    type=\"text\"\n    placeholder=\"Ask Lucille something...\"\n    autocomplete=\"off\"\n    autocorrect=\"off\"\n    spellcheck=\"false\"\n  />\n  <button id=\"send-btn\" onclick=\"sendToLucille()\">Send</button>\n</div>\n\n<!-- Pixel Streaming frontend SDK -->\n<script src=\"https://streams.vagon.io/streams/ff9eea5c-d922-4467-9b18-d892255b10c3\"></script>\n\n<script>\n  var ps = null;\n\n  // Wait for Pixel Streaming to initialize\n  function initPixelStreaming() {\n    if (window.pixelStreaming) {\n      ps = window.pixelStreaming;\n      document.getElementById(\'status\').textContent = \'Lucille is ready\';\n      setTimeout(function() {\n        document.getElementById(\'status\').style.opacity = \'0\';\n      }, 2000);\n    } else {\n      setTimeout(initPixelStreaming, 500);\n    }\n  }\n\n  // Send message to Lucille via Pixel Streaming\n  function sendToLucille() {\n    var input = document.getElementById(\'lucille-input\');\n    var message = input.value.trim();\n    \n    if (!message) return;\n    \n    if (ps) {\n      ps.emitUIInteraction(JSON.stringify({\n        type: \'lucille_message\',\n        content: message\n      }));\n      input.value = \'\';\n      console.log(\'Sent to Lucille: \' + message);\n    } else {\n      document.getElementById(\'status\').textContent = \'Not connected yet — try again\';\n      document.getElementById(\'status\').style.opacity = \'1\';\n    }\n  }\n\n  // Enter key sends message\n  document.getElementById(\'lucille-input\')\n    .addEventListener(\'keypress\', function(e) {\n      if (e.key === \'Enter\') sendToLucille();\n    });\n\n  // Start checking for Pixel Streaming\n  window.addEventListener(\'load\', function() {\n    setTimeout(initPixelStreaming, 1000);\n  });\n</script>\n\n</body>\n</html>',
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    verticalScroll: true,
                    horizontalScroll: true,
                    html: true,
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.071,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 40,
                        color: FlutterFlowTheme.of(context).accent1,
                        offset: Offset(
                          0,
                          0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0x49EDF1F7),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Stack(
                      alignment: AlignmentDirectional(0, 0),
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 2000),
                                () => safeSetState(() {}),
                              ),
                              autofocus: true,
                              enabled: true,
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.send,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: FFLocalizations.of(context).getText(
                                  '9jutrng2' /* Type something... */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      letterSpacing: 0.0,
                                    ),
                                errorStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 12,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x52EDF1F7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 70, 24),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    letterSpacing: 0.0,
                                  ),
                              maxLines: 8,
                              minLines: 1,
                              cursorColor: FlutterFlowTheme.of(context).primary,
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
                        Align(
                          alignment: AlignmentDirectional(1, -1),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            hoverColor: FlutterFlowTheme.of(context).accent1,
                            hoverIconColor:
                                FlutterFlowTheme.of(context).secondary,
                            hoverBorderColor: Color(0x47EDF1F7),
                            icon: Icon(
                              Icons.send_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 30,
                            ),
                            showLoadingIndicator: true,
                            onPressed: () async {
                              logFirebaseEvent(
                                  'VOICE_CHAT_LUCILLE_send_rounded_ICN_ON_T');
                              if (_model.textController.text != null &&
                                  _model.textController.text != '') {
                                logFirebaseEvent('IconButton_update_app_state');
                                FFAppState().lucilleMessage =
                                    _model.textController.text;
                                safeSetState(() {});
                                logFirebaseEvent('IconButton_custom_action');
                                await actions.sendToLucille(
                                  FFAppState().lucilleMessage,
                                );
                              } else {
                                return;
                              }

                              logFirebaseEvent(
                                  'IconButton_clear_text_fields_pin_codes');
                              safeSetState(() {
                                _model.textController?.clear();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
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
