import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'bottom_sheets_model.dart';
export 'bottom_sheets_model.dart';

/// Collect user feedback on each page to know if they liked the content or
/// found it interesting.
class BottomSheetsWidget extends StatefulWidget {
  const BottomSheetsWidget({super.key});

  static String routeName = 'BottomSheets';
  static String routePath = 'bottomSheets';

  @override
  State<BottomSheetsWidget> createState() => _BottomSheetsWidgetState();
}

class _BottomSheetsWidgetState extends State<BottomSheetsWidget> {
  late BottomSheetsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomSheetsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BottomSheets'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
