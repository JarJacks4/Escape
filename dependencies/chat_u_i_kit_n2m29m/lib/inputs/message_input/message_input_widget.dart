import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_input_model.dart';
export 'message_input_model.dart';

/// A message input widget that includes a text field, a send button styled
/// with the primary color, and optional icons for attachments and custom
/// actions.
class MessageInputWidget extends StatefulWidget {
  const MessageInputWidget({
    super.key,
    bool? hasAttachment,
    bool? hasCustomIcon,
    this.customIcon,
    this.customAction,
    required this.onSendMessage,
    this.onTapAttachment,
    this.bgColor,
  })  : this.hasAttachment = hasAttachment ?? false,
        this.hasCustomIcon = hasCustomIcon ?? false;

  final bool hasAttachment;

  /// Toggles a custom icon in the input field.
  ///
  /// Enable this to show an icon of your choice.
  final bool hasCustomIcon;

  /// Provide the custom icon to display in the input field when hasCustomIcon
  /// is enabled.
  final Widget? customIcon;

  /// Defines the action to be executed when the custom icon is tapped.
  ///
  /// Use this to trigger custom functionality like opening a modal, starting
  /// voice input, or launching a custom flow.
  final Future Function()? customAction;

  /// Action on tap of the send button.
  final Future Function(String messageText)? onSendMessage;

  final Future Function()? onTapAttachment;

  /// Background color of the entire component.
  final Color? bgColor;

  @override
  State<MessageInputWidget> createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {
  late MessageInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageInputModel());

    _model.sendMessageTextController ??= TextEditingController();
    _model.sendMessageFocusNode ??= FocusNode();
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
      decoration: BoxDecoration(
        color: widget!.bgColor != null
            ? widget!.bgColor
            : FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget!.hasAttachment)
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.attach_file_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await widget.onTapAttachment?.call();
                    },
                  ),
                if (widget!.hasCustomIcon)
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: widget!.customIcon!,
                    onPressed: () async {
                      await widget.customAction?.call();
                    },
                  ),
              ].divide(SizedBox(width: 12.0)),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: TextFormField(
                  controller: _model.sendMessageTextController,
                  focusNode: _model.sendMessageFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Send a message',
                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    contentPadding: EdgeInsetsDirectional.fromSTEB(
                        valueOrDefault<double>(
                          utility_functions_library_8g4bud_app_constant
                              .FFAppConstants.padding24,
                          0.0,
                        ),
                        valueOrDefault<double>(
                          utility_functions_library_8g4bud_app_constant
                              .FFAppConstants.padding8,
                          0.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          utility_functions_library_8g4bud_app_constant
                              .FFAppConstants.padding8,
                          0.0,
                        )),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  maxLines: 5,
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  validator: _model.sendMessageTextControllerValidator
                      .asValidator(context),
                ),
              ),
            ),
            FlutterFlowIconButton(
              borderRadius: 22.0,
              buttonSize: 44.0,
              fillColor: FlutterFlowTheme.of(context).primary,
              icon: Icon(
                Icons.send_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              onPressed: () async {
                _model.textInput = _model.sendMessageTextController.text;
                safeSetState(() {});
                safeSetState(() {
                  _model.sendMessageTextController?.clear();
                });
                await widget.onSendMessage?.call(
                  _model.textInput!,
                );
              },
            ),
          ].divide(SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
