import '/components/accordion_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'accordion_model.dart';
export 'accordion_model.dart';

class AccordionWidget extends StatefulWidget {
  const AccordionWidget({
    super.key,
    String? title1,
    String? content1,
    String? title2,
    String? content2,
    String? title3,
    String? content3,
    bool? open1,
    bool? open2,
    bool? open3,
  })  : this.title1 = title1 ?? 'Morning Patterns',
        this.content1 = content1 ??
            'You tend to feel most energetic between 8 AM and 10 AM after your meditation.',
        this.title2 = title2 ?? 'Stress Triggers',
        this.content2 = content2 ??
            'Increased screen time on Tuesdays correlates with a lower mood score.',
        this.title3 = title3 ?? 'Sleep Impact',
        this.content3 = content3 ??
            '8+ hours of sleep consistently leads to \'Joyful\' ratings the next day.',
        this.open1 = open1 ?? true,
        this.open2 = open2 ?? false,
        this.open3 = open3 ?? false;

  final String title1;
  final String content1;
  final String title2;
  final String content2;
  final String title3;
  final String content3;
  final bool open1;
  final bool open2;
  final bool open3;

  @override
  State<AccordionWidget> createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  late AccordionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccordionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            wrapWithModel(
              model: _model.accordionItemModel1,
              updateCallback: () => safeSetState(() {}),
              child: AccordionItemWidget(
                title: valueOrDefault<String>(
                  widget.title1,
                  'Morning Patterns',
                ),
                content: valueOrDefault<String>(
                  widget.content1,
                  'You tend to feel most energetic between 8 AM and 10 AM after your meditation.',
                ),
                open: widget.open1 ? true : false,
                last: false,
              ),
            ),
            wrapWithModel(
              model: _model.accordionItemModel2,
              updateCallback: () => safeSetState(() {}),
              child: AccordionItemWidget(
                title: valueOrDefault<String>(
                  widget.title2,
                  'Stress Triggers',
                ),
                content: valueOrDefault<String>(
                  widget.content2,
                  'Increased screen time on Tuesdays correlates with a lower mood score.',
                ),
                open: widget.open2 ? true : false,
                last: false,
              ),
            ),
            wrapWithModel(
              model: _model.accordionItemModel3,
              updateCallback: () => safeSetState(() {}),
              child: AccordionItemWidget(
                title: valueOrDefault<String>(
                  widget.title3,
                  'Sleep Impact',
                ),
                content: valueOrDefault<String>(
                  widget.content3,
                  '8+ hours of sleep consistently leads to \'Joyful\' ratings the next day.',
                ),
                open: widget.open3 ? true : false,
                last: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
