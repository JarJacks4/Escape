import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'button6_model.dart';
export 'button6_model.dart';

class Button6Widget extends StatefulWidget {
  const Button6Widget({
    super.key,
    String? content,
    this.icon,
    bool? iconPresent,
    this.iconEnd,
    bool? iconEndPresent,
    String? radius,
    String? variant,
    String? size,
    bool? fullWidth,
    bool? loading,
    bool? disabled,
  })  : this.content = content ?? 'Download Report',
        this.iconPresent = iconPresent ?? true,
        this.iconEndPresent = iconEndPresent ?? false,
        this.radius = radius ?? 'full',
        this.variant = variant ?? 'outline',
        this.size = size ?? 'medium',
        this.fullWidth = fullWidth ?? true,
        this.loading = loading ?? false,
        this.disabled = disabled ?? false;

  final String content;
  final Widget? icon;
  final bool iconPresent;
  final Widget? iconEnd;
  final bool iconEndPresent;
  final String radius;
  final String variant;
  final String size;
  final bool fullWidth;
  final bool loading;
  final bool disabled;

  @override
  State<Button6Widget> createState() => _Button6WidgetState();
}

class _Button6WidgetState extends State<Button6Widget> {
  late Button6Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Button6Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: valueOrDefault<double>(
        valueOrDefault<bool>(
          widget.disabled,
          false,
        )
            ? 0.55
            : 1.0,
        1.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            () {
              if (valueOrDefault<String>(
                    widget.variant,
                    'outline',
                  ) ==
                  'secondary') {
                return FlutterFlowTheme.of(context).secondary;
              } else if (valueOrDefault<String>(
                    widget.variant,
                    'outline',
                  ) ==
                  'outline') {
                return Colors.transparent;
              } else if (valueOrDefault<String>(
                    widget.variant,
                    'outline',
                  ) ==
                  'ghost') {
                return Colors.transparent;
              } else if (valueOrDefault<String>(
                    widget.variant,
                    'outline',
                  ) ==
                  'destructive') {
                return FlutterFlowTheme.of(context).error;
              } else {
                return FlutterFlowTheme.of(context).primary;
              }
            }(),
            Colors.transparent,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(valueOrDefault<double>(
              () {
                if (valueOrDefault<String>(
                      widget.size,
                      'medium',
                    ) ==
                    'small') {
                  return 4.0;
                } else if (valueOrDefault<String>(
                      widget.size,
                      'medium',
                    ) ==
                    'large') {
                  return 16.0;
                } else {
                  return 8.0;
                }
              }(),
              8.0,
            )),
            topRight: Radius.circular(valueOrDefault<double>(
              () {
                if (valueOrDefault<String>(
                      widget.size,
                      'medium',
                    ) ==
                    'small') {
                  return 4.0;
                } else if (valueOrDefault<String>(
                      widget.size,
                      'medium',
                    ) ==
                    'large') {
                  return 16.0;
                } else {
                  return 8.0;
                }
              }(),
              8.0,
            )),
            bottomLeft: Radius.circular(valueOrDefault<double>(
              () {
                if (valueOrDefault<String>(
                      widget.size,
                      'medium',
                    ) ==
                    'small') {
                  return 4.0;
                } else if (valueOrDefault<String>(
                      widget.size,
                      'medium',
                    ) ==
                    'large') {
                  return 16.0;
                } else {
                  return 8.0;
                }
              }(),
              8.0,
            )),
            bottomRight: Radius.circular(valueOrDefault<double>(
              () {
                if (valueOrDefault<String>(
                      widget.size,
                      'medium',
                    ) ==
                    'small') {
                  return 4.0;
                } else if (valueOrDefault<String>(
                      widget.size,
                      'medium',
                    ) ==
                    'large') {
                  return 16.0;
                } else {
                  return 8.0;
                }
              }(),
              8.0,
            )),
          ),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: valueOrDefault<Color>(
              valueOrDefault<String>(
                        widget.variant,
                        'outline',
                      ) ==
                      'outline'
                  ? FlutterFlowTheme.of(context).alternate
                  : Colors.transparent,
              FlutterFlowTheme.of(context).alternate,
            ),
            width: valueOrDefault<double>(
              valueOrDefault<String>(
                        widget.variant,
                        'outline',
                      ) ==
                      'outline'
                  ? 1.0
                  : 0.0,
              1.0,
            ),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional(0.0, 0.0),
          children: [
            Opacity(
              opacity: valueOrDefault<double>(
                valueOrDefault<bool>(
                  widget.loading,
                  false,
                )
                    ? 0.0
                    : 1.0,
                1.0,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      () {
                        if (valueOrDefault<String>(
                              widget.size,
                              'medium',
                            ) ==
                            'small') {
                          return 16.0;
                        } else if (valueOrDefault<String>(
                              widget.size,
                              'medium',
                            ) ==
                            'large') {
                          return 32.0;
                        } else {
                          return 24.0;
                        }
                      }(),
                      24.0,
                    ),
                    valueOrDefault<double>(
                      () {
                        if (valueOrDefault<String>(
                              widget.size,
                              'medium',
                            ) ==
                            'small') {
                          return 4.0;
                        } else if (valueOrDefault<String>(
                              widget.size,
                              'medium',
                            ) ==
                            'large') {
                          return 16.0;
                        } else {
                          return 8.0;
                        }
                      }(),
                      8.0,
                    ),
                    valueOrDefault<double>(
                      () {
                        if (valueOrDefault<String>(
                              widget.size,
                              'medium',
                            ) ==
                            'small') {
                          return 16.0;
                        } else if (valueOrDefault<String>(
                              widget.size,
                              'medium',
                            ) ==
                            'large') {
                          return 32.0;
                        } else {
                          return 24.0;
                        }
                      }(),
                      24.0,
                    ),
                    valueOrDefault<double>(
                      () {
                        if (valueOrDefault<String>(
                              widget.size,
                              'medium',
                            ) ==
                            'small') {
                          return 4.0;
                        } else if (valueOrDefault<String>(
                              widget.size,
                              'medium',
                            ) ==
                            'large') {
                          return 16.0;
                        } else {
                          return 8.0;
                        }
                      }(),
                      8.0,
                    )),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.icon!,
                    Text(
                      valueOrDefault<String>(
                        widget.content,
                        'Download Report',
                      ),
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            color: valueOrDefault<Color>(
                              () {
                                if (valueOrDefault<String>(
                                      widget.variant,
                                      'outline',
                                    ) ==
                                    'secondary') {
                                  return Color(0x00000000);
                                } else if (valueOrDefault<String>(
                                      widget.variant,
                                      'outline',
                                    ) ==
                                    'outline') {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                } else if (valueOrDefault<String>(
                                      widget.variant,
                                      'outline',
                                    ) ==
                                    'ghost') {
                                  return FlutterFlowTheme.of(context).primary;
                                } else if (valueOrDefault<String>(
                                      widget.variant,
                                      'outline',
                                    ) ==
                                    'destructive') {
                                  return Color(0x00000000);
                                } else {
                                  return Color(0x00000000);
                                }
                              }(),
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                      overflow: TextOverflow.clip,
                    ),
                    widget.iconEnd!,
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
            ),
            CircularPercentIndicator(
              percent: 0.0,
              radius: 7.0,
              lineWidth: 2.0,
              animation: true,
              animateFromLastPercent: true,
              progressColor: valueOrDefault<Color>(
                () {
                  if (valueOrDefault<String>(
                        widget.variant,
                        'outline',
                      ) ==
                      'secondary') {
                    return Color(0x00000000);
                  } else if (valueOrDefault<String>(
                        widget.variant,
                        'outline',
                      ) ==
                      'outline') {
                    return FlutterFlowTheme.of(context).primaryText;
                  } else if (valueOrDefault<String>(
                        widget.variant,
                        'outline',
                      ) ==
                      'ghost') {
                    return FlutterFlowTheme.of(context).primary;
                  } else if (valueOrDefault<String>(
                        widget.variant,
                        'outline',
                      ) ==
                      'destructive') {
                    return Color(0x00000000);
                  } else {
                    return Color(0x00000000);
                  }
                }(),
                FlutterFlowTheme.of(context).primaryText,
              ),
              backgroundColor: FlutterFlowTheme.of(context).alternate,
            ),
          ],
        ),
      ),
    );
  }
}
