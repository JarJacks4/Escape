import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'music_detail_card_model.dart';
export 'music_detail_card_model.dart';

class MusicDetailCardWidget extends StatefulWidget {
  const MusicDetailCardWidget({
    super.key,
    this.musicName,
    this.artName,
    this.image,
    this.select,
    required this.action,
  });

  final String? musicName;
  final String? artName;
  final String? image;
  final String? select;
  final Future Function(String musicName)? action;

  @override
  State<MusicDetailCardWidget> createState() => _MusicDetailCardWidgetState();
}

class _MusicDetailCardWidgetState extends State<MusicDetailCardWidget> {
  late MusicDetailCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicDetailCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('MUSIC_DETAIL_CARD_Container_opfrcjj6_ON_');
          logFirebaseEvent('Container_execute_callback');
          await widget.action?.call(
            widget.musicName!,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              widget.select == widget.artName
                  ? FlutterFlowTheme.of(context).accent1
                  : Color(0x6FD0E3F7),
              Color(0x73D0E3F7),
            ),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Color(0x2BEDF1F7),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        widget.image!,
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.musicName,
                            'Title',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.artName,
                            'Artist',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(height: 6.0)),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
