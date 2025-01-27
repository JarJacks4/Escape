import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_data_model.dart';
export 'empty_data_model.dart';

class EmptyDataWidget extends StatefulWidget {
  const EmptyDataWidget({super.key});

  @override
  State<EmptyDataWidget> createState() => _EmptyDataWidgetState();
}

class _EmptyDataWidgetState extends State<EmptyDataWidget> {
  late EmptyDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyDataModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        FFLocalizations.of(context).getText(
          'eyl811k0' /* How may I help you? */,
        ),
        style: FlutterFlowTheme.of(context).labelLarge.override(
              fontFamily: 'The Seasons',
              color: FlutterFlowTheme.of(context).alternate,
              fontSize: 20.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
              useGoogleFonts: false,
            ),
      ),
    );
  }
}
