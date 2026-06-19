import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_bubble_glass_model.dart';
export 'chat_bubble_glass_model.dart';

class ChatBubbleGlassWidget extends StatefulWidget {
  const ChatBubbleGlassWidget({
    super.key,
    String? colId,
    String? contId,
    String? message,
    String? rowId,
    String? time,
    String? timeId,
    String? txtId,
    bool? isAi,
  })  : this.colId = colId ?? 'cl1',
        this.contId = contId ?? 'c1',
        this.message = message ??
            'Hello Sarah. I\'m here to listen. How are you feeling today?',
        this.rowId = rowId ?? 'msg1',
        this.time = time ?? '9:41 AM',
        this.timeId = timeId ?? 'tm1',
        this.txtId = txtId ?? 't1',
        this.isAi = isAi ?? true;

  final String colId;
  final String contId;
  final String message;
  final String rowId;
  final String time;
  final String timeId;
  final String txtId;
  final bool isAi;

  @override
  State<ChatBubbleGlassWidget> createState() => _ChatBubbleGlassWidgetState();
}

class _ChatBubbleGlassWidgetState extends State<ChatBubbleGlassWidget> {
  late ChatBubbleGlassModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBubbleGlassModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 12.0,
                sigmaY: 12.0,
              ),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 320.0,
                ),
                decoration: BoxDecoration(
                  color: widget.isAi ? Color(0x99FFFFFF) : Color(0xCC39519F),
                  borderRadius: BorderRadius.circular(24.0),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0x4DFFFFFF),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.message,
                            'Hello Sarah. I\'m here to listen. How are you feeling today?',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.workSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: widget.isAi
                                        ? Color(0xFF1C2444)
                                        : Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.time,
                            '9:41 AM',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: widget.isAi
                                        ? Color(0x991C2444)
                                        : Color(0xB3FFFFFF),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
