import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'activity_card_model.dart';
export 'activity_card_model.dart';

class ActivityCardWidget extends StatefulWidget {
  const ActivityCardWidget({
    super.key,
    String? btnId,
    String? contId,
    String? duration,
    String? imgDesc,
    String? title,
  })  : this.btnId = btnId ?? 'btn1',
        this.contId = contId ?? 'act1',
        this.duration = duration ?? '5-10 Minutes',
        this.imgDesc = imgDesc ??
            'https://dimg.dreamflow.cloud/v1/image/calm%20blue%20water%20ripples',
        this.title = title ?? 'Breathing Exercise';

  final String btnId;
  final String contId;
  final String duration;
  final String imgDesc;
  final String title;

  @override
  State<ActivityCardWidget> createState() => _ActivityCardWidgetState();
}

class _ActivityCardWidgetState extends State<ActivityCardWidget> {
  late ActivityCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityCardModel());
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
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20.0,
              sigmaY: 20.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0x80FFFFFF),
                borderRadius: BorderRadius.circular(24.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color(0x66FFFFFF),
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          width: 64.0,
                          height: 64.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 0),
                            fadeOutDuration: Duration(milliseconds: 0),
                            imageUrl: valueOrDefault<String>(
                              widget.imgDesc,
                              'https://dimg.dreamflow.cloud/v1/image/calm%20blue%20water%20ripples',
                            ),
                            width: 64.0,
                            height: 64.0,
                            fit: BoxFit.cover,
                            alignment: Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.title,
                                'Breathing Exercise',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.cormorantSc(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.duration,
                                '5-10 Minutes',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.buttonModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ButtonWidget(
                          content: 'Start',
                          iconPresent: false,
                          iconEndPresent: false,
                          variant: 'primary',
                          size: 'small',
                          fullWidth: false,
                          loading: false,
                          disabled: false,
                        ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
