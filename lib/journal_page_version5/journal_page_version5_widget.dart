import '/components/journal_page1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'journal_page_version5_model.dart';
export 'journal_page_version5_model.dart';

class JournalPageVersion5Widget extends StatefulWidget {
  const JournalPageVersion5Widget({super.key});

  static String routeName = 'JournalPageVersion5';
  static String routePath = 'journalPageVersion5';

  @override
  State<JournalPageVersion5Widget> createState() =>
      _JournalPageVersion5WidgetState();
}

class _JournalPageVersion5WidgetState extends State<JournalPageVersion5Widget> {
  late JournalPageVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalPageVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'JournalPageVersion5'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 871.76,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).secondary
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: wrapWithModel(
                  model: _model.journalPage1Model,
                  updateCallback: () => safeSetState(() {}),
                  child: JournalPage1Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
