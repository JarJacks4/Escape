import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:convert';
import 'dart:ui';
import '/index.dart';
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_with_lucille_card_model.dart';
export 'chat_with_lucille_card_model.dart';

class ChatWithLucilleCardWidget extends StatefulWidget {
  const ChatWithLucilleCardWidget({super.key});

  @override
  State<ChatWithLucilleCardWidget> createState() =>
      _ChatWithLucilleCardWidgetState();
}

class _ChatWithLucilleCardWidgetState extends State<ChatWithLucilleCardWidget> {
  late ChatWithLucilleCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatWithLucilleCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: 160.0,
        height: 221.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/Clean_and_organic_AI_interface_by_milkinside.gif',
            ).image,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xB6EDF1F7), Color(0xC939519F)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Align(
            alignment: AlignmentDirectional(1.0, 1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 1,
                      child: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.arrow_outward,
                          color: FlutterFlowTheme.of(context).alternate,
                          size: 24.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: () async {
                          logFirebaseEvent(
                              'CHAT_WITH_LUCILLE_CARD_arrow_outward_ICN');
                          logFirebaseEvent('IconButton_backend_call');
                          _model.apiResult2tjCopy =
                              await GetSessionIdCall.call();

                          if ((_model.apiResult2tjCopy?.succeeded ?? true)) {
                            logFirebaseEvent('IconButton_update_app_state');
                            FFAppState().chatSessionId =
                                (_model.apiResult2tjCopy?.succeeded ?? true)
                                    .toString();
                            FFAppState().update(() {});
                          }
                          logFirebaseEvent('IconButton_navigate_to');

                          context.pushNamed(
                            LucilleGPTWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 2),
                              ),
                            },
                          );

                          safeSetState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ny9c3thm' /* Chat with 
Lucille */
                            ,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'The Seasons',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/ESCAPE_Logo_Clear.png',
                                width: 35.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
