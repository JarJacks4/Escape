import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'button5_model.dart';
export 'button5_model.dart';

class Button5Widget extends StatefulWidget {
  const Button5Widget({
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
  })  : this.content = content ?? 'Check Stress',
        this.iconPresent = iconPresent ?? true,
        this.iconEndPresent = iconEndPresent ?? false,
        this.radius = radius ?? 'full',
        this.variant = variant ?? 'primary',
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
  State<Button5Widget> createState() => _Button5WidgetState();
}

class _Button5WidgetState extends State<Button5Widget> {
  late Button5Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Button5Model());
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
                    'primary',
                  ) ==
                  'secondary') {
                return FlutterFlowTheme.of(context).secondary;
              } else if (valueOrDefault<String>(
                    widget.variant,
                    'primary',
                  ) ==
                  'outline') {
                return Colors.transparent;
              } else if (valueOrDefault<String>(
                    widget.variant,
                    'primary',
                  ) ==
                  'ghost') {
                return Colors.transparent;
              } else if (valueOrDefault<String>(
                    widget.variant,
                    'primary',
                  ) ==
                  'destructive') {
                return FlutterFlowTheme.of(context).error;
              } else {
                return FlutterFlowTheme.of(context).primary;
              }
            }(),
            FlutterFlowTheme.of(context).primary,
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
                        'primary',
                      ) ==
                      'outline'
                  ? FlutterFlowTheme.of(context).alternate
                  : Colors.transparent,
              Colors.transparent,
            ),
            width: valueOrDefault<double>(
              valueOrDefault<String>(
                        widget.variant,
                        'primary',
                      ) ==
                      'outline'
                  ? 1.0
                  : 0.0,
              0.0,
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
                    Text(
                      valueOrDefault<String>(
                        widget.content,
                        'Check Stress',
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
                                      'primary',
                                    ) ==
                                    'secondary') {
                                  return Color(0x00FFFFFF);
                                } else if (valueOrDefault<String>(
                                      widget.variant,
                                      'primary',
                                    ) ==
                                    'outline') {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                } else if (valueOrDefault<String>(
                                      widget.variant,
                                      'primary',
                                    ) ==
                                    'ghost') {
                                  return FlutterFlowTheme.of(context).primary;
                                } else if (valueOrDefault<String>(
                                      widget.variant,
                                      'primary',
                                    ) ==
                                    'destructive') {
                                  return Color(0x00000000);
                                } else {
                                  return Color(0x00000000);
                                }
                              }(),
                              Color(0x00000000),
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
                        'primary',
                      ) ==
                      'secondary') {
                    return Color(0x00000000);
                  } else if (valueOrDefault<String>(
                        widget.variant,
                        'primary',
                      ) ==
                      'outline') {
                    return FlutterFlowTheme.of(context).primaryText;
                  } else if (valueOrDefault<String>(
                        widget.variant,
                        'primary',
                      ) ==
                      'ghost') {
                    return FlutterFlowTheme.of(context).primary;
                  } else if (valueOrDefault<String>(
                        widget.variant,
                        'primary',
                      ) ==
                      'destructive') {
                    return Color(0x00000000);
                  } else {
                    return Color(0x00000000);
                  }
                }(),
                Color(0x00000000),
              ),
              backgroundColor: FlutterFlowTheme.of(context).alternate,
            ),
          ],
        ),
      ),
    );
  }
}
