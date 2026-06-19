import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mood_category_card_model.dart';
export 'mood_category_card_model.dart';

class MoodCategoryCardWidget extends StatefulWidget {
  const MoodCategoryCardWidget({
    super.key,
    Color? bgColor,
    this.icon,
    String? subtitle,
    String? title,
  })  : this.bgColor = bgColor ?? const Color(0x00000000),
        this.subtitle = subtitle ?? 'Melodies to unwind',
        this.title = title ?? 'Relax';

  final Color bgColor;
  final Widget? icon;
  final String subtitle;
  final String title;

  @override
  State<MoodCategoryCardWidget> createState() => _MoodCategoryCardWidgetState();
}

class _MoodCategoryCardWidgetState extends State<MoodCategoryCardWidget> {
  late MoodCategoryCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodCategoryCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
      child: Container(
        child: Container(
          width: 240.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              widget.bgColor,
              Color(0x00000000),
            ),
            borderRadius: BorderRadius.circular(24.0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Container(
              child: Stack(
                alignment: AlignmentDirectional(-1.0, -1.0),
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.title,
                            'Relax',
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.cormorantSc(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.subtitle,
                            'Melodies to unwind',
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
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Container(
                      child: widget.icon!,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
