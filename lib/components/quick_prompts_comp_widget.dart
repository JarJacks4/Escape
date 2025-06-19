import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quick_prompts_comp_model.dart';
export 'quick_prompts_comp_model.dart';

class QuickPromptsCompWidget extends StatefulWidget {
  const QuickPromptsCompWidget({super.key});

  @override
  State<QuickPromptsCompWidget> createState() => _QuickPromptsCompWidgetState();
}

class _QuickPromptsCompWidgetState extends State<QuickPromptsCompWidget> {
  late QuickPromptsCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuickPromptsCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional(0.0, 0.0),
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent1,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    '5ew048lr' /* Sleep
meditations */
                    ,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'WorkSans',
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.normal,
                        lineHeight: 1.5,
                      ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ],
      ),
    );
  }
}
