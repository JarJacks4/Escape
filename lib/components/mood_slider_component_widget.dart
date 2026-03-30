import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'mood_slider_component_model.dart';
export 'mood_slider_component_model.dart';

class MoodSliderComponentWidget extends StatefulWidget {
  const MoodSliderComponentWidget({super.key});

  @override
  State<MoodSliderComponentWidget> createState() =>
      _MoodSliderComponentWidgetState();
}

class _MoodSliderComponentWidgetState extends State<MoodSliderComponentWidget> {
  late MoodSliderComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodSliderComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
      child: Container(
        width: 394.8,
        height: 144.58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 364.97,
                  height: 100.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 40.0,
                        color: FlutterFlowTheme.of(context).secondary,
                        offset: Offset(
                          0.0,
                          0.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: SliderTheme(
                    data: SliderThemeData(
                      showValueIndicator: ShowValueIndicator.onDrag,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Slider.adaptive(
                        activeColor: FlutterFlowTheme.of(context).accent1,
                        inactiveColor: FlutterFlowTheme.of(context).primary,
                        min: 0.0,
                        max: 10.0,
                        value: _model.sliderValue ??= 5.0,
                        label: _model.sliderValue?.toStringAsFixed(2),
                        onChanged: (newValue) {
                          newValue = double.parse(newValue.toStringAsFixed(2));
                          safeSetState(() => _model.sliderValue = newValue);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        formatNumber(
                          _model.sliderValue,
                          formatType: FormatType.percent,
                        ),
                        '1.0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color: valueOrDefault<Color>(
                              _model.sliderValue! <= 3.0
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).alternate,
                              FlutterFlowTheme.of(context).alternate,
                            ),
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '4refjnjb' /* Balanced */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color: valueOrDefault<Color>(
                              formatNumber(
                                        _model.sliderValue,
                                        formatType: FormatType.percent,
                                      ) ==
                                      '5.0'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).alternate,
                              FlutterFlowTheme.of(context).alternate,
                            ),
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'i4erhk81' /* Elevated */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color: valueOrDefault<Color>(
                              _model.sliderValue! >= 7.0
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).alternate,
                              FlutterFlowTheme.of(context).alternate,
                            ),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(width: 25.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
