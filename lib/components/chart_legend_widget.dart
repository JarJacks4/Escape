import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'chart_legend_model.dart';
export 'chart_legend_model.dart';

class ChartLegendWidget extends StatefulWidget {
  const ChartLegendWidget({
    super.key,
    String? data,
    String? labels,
    String? colors,
    double? markerSize,
    double? spacing,
    double? runSpacing,
    Color? labelColor,
    Color? valueColor,
    String? textStyle,
    String? valueStyle,
    double? labelMaxWidth,
    String? direction,
    String? valueMode,
  })  : this.data = data ?? 'SlotValue(\$data)',
        this.labels = labels ?? 'SlotValue(\$labels)',
        this.colors = colors ?? 'SlotValue(\$colors)',
        this.markerSize = markerSize ?? 8.0,
        this.spacing = spacing ?? 6.0,
        this.runSpacing = runSpacing ?? 8.0,
        this.labelColor = labelColor ?? const Color(0x00000000),
        this.valueColor = valueColor ?? const Color(0x00000000),
        this.textStyle = textStyle ?? 'label_small',
        this.valueStyle = valueStyle ?? 'label_small',
        this.labelMaxWidth = labelMaxWidth ?? 0.0,
        this.direction = direction ?? 'vertical',
        this.valueMode = valueMode ?? 'percent';

  final String data;
  final String labels;
  final String colors;
  final double markerSize;
  final double spacing;
  final double runSpacing;
  final Color labelColor;
  final Color valueColor;
  final String textStyle;
  final String valueStyle;
  final double labelMaxWidth;
  final String direction;
  final String valueMode;

  @override
  State<ChartLegendWidget> createState() => _ChartLegendWidgetState();
}

class _ChartLegendWidgetState extends State<ChartLegendWidget> {
  late ChartLegendModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChartLegendModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0,
      height: 1.0,
    );
  }
}
