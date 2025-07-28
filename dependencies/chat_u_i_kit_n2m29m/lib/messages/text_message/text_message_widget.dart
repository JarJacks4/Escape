import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_message_model.dart';
export 'text_message_model.dart';

/// Component for displaying text messages.
class TextMessageWidget extends StatefulWidget {
  const TextMessageWidget({
    super.key,
    bool? isUser,
    bool? hasAngledCorner,
    required this.message,
  })  : this.isUser = isUser ?? false,
        this.hasAngledCorner = hasAngledCorner ?? false;

  /// Is the sender the current user?
  final bool isUser;

  /// Enables a diagonal or angled corner style for this UI element.
  ///
  /// Turn this on if you want the message bubble to have a cut corner instead
  /// of a rounded one.
  final bool hasAngledCorner;

  /// Text message sent by the current user.
  final MessageStruct? message;

  @override
  State<TextMessageWidget> createState() => _TextMessageWidgetState();
}

class _TextMessageWidgetState extends State<TextMessageWidget> {
  late TextMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextMessageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget!.isUser) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.showTimestampAndStatus =
                                !_model.showTimestampAndStatus;
                            safeSetState(() {});
                          },
                          onLongPress: () async {
                            await Clipboard.setData(
                                ClipboardData(text: widget!.message!.text));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Message copied',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).tertiary,
                              ),
                            );
                          },
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.sizeOf(context).width * 0.6,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(26.0),
                                bottomRight:
                                    Radius.circular(valueOrDefault<double>(
                                  widget!.hasAngledCorner ? 2.0 : 26.0,
                                  0.0,
                                )),
                                topLeft: Radius.circular(26.0),
                                topRight: Radius.circular(26.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    utility_functions_library_8g4bud_app_constant
                                        .FFAppConstants.padding12,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    utility_functions_library_8g4bud_app_constant
                                        .FFAppConstants.padding8,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    utility_functions_library_8g4bud_app_constant
                                        .FFAppConstants.padding12,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    utility_functions_library_8g4bud_app_constant
                                        .FFAppConstants.padding8,
                                    0.0,
                                  )),
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.message?.text,
                                  '[message]',
                                ),
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.customAvatarModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: CustomAvatarWidget(
                              showOnlineStatus: false,
                              isSmallSize: true,
                              sender: widget!.message!.sender,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_model.showTimestampAndStatus)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (widget!.message?.status != MessageStatus.SENT)
                            Builder(
                              builder: (context) {
                                if (widget!.message?.status ==
                                    MessageStatus.READ) {
                                  return Icon(
                                    FFIcons.kreadMessage,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  );
                                } else {
                                  return Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  );
                                }
                              },
                            ),
                          Text(
                            dateTimeFormat("jm", widget!.message!.timestamp!),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 2.0)),
                      ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        wrapWithModel(
                          model: _model.customAvatarModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: CustomAvatarWidget(
                            showOnlineStatus: false,
                            isSmallSize: true,
                            sender: widget!.message!.sender,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.showTimestampAndStatus =
                                !_model.showTimestampAndStatus;
                            safeSetState(() {});
                          },
                          onLongPress: () async {
                            await Clipboard.setData(
                                ClipboardData(text: widget!.message!.text));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Message copied',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          },
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.sizeOf(context).width * 0.6,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(valueOrDefault<double>(
                                  widget!.hasAngledCorner ? 2.0 : 26.0,
                                  0.0,
                                )),
                                bottomRight: Radius.circular(26.0),
                                topLeft: Radius.circular(26.0),
                                topRight: Radius.circular(26.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    utility_functions_library_8g4bud_app_constant
                                        .FFAppConstants.padding16,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    utility_functions_library_8g4bud_app_constant
                                        .FFAppConstants.padding8,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    utility_functions_library_8g4bud_app_constant
                                        .FFAppConstants.padding12,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    utility_functions_library_8g4bud_app_constant
                                        .FFAppConstants.padding8,
                                    0.0,
                                  )),
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.message?.text,
                                  '[message] ',
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_model.showTimestampAndStatus)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget!.message?.status != MessageStatus.SENT)
                            Builder(
                              builder: (context) {
                                if (widget!.message?.status ==
                                    MessageStatus.READ) {
                                  return Icon(
                                    FFIcons.kreadMessage,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  );
                                } else {
                                  return Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  );
                                }
                              },
                            ),
                          Text(
                            dateTimeFormat("jm", widget!.message!.timestamp!),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 2.0)),
                      ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
