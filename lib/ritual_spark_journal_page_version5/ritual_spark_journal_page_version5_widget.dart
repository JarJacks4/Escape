import '/components/journal_page1_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'ritual_spark_journal_page_version5_model.dart';
export 'ritual_spark_journal_page_version5_model.dart';

class RitualSparkJournalPageVersion5Widget extends StatefulWidget {
  const RitualSparkJournalPageVersion5Widget({super.key});

  static String routeName = 'RitualSparkJournalPageVersion5';
  static String routePath = 'ritualSparkJournalPageVersion5';

  @override
  State<RitualSparkJournalPageVersion5Widget> createState() =>
      _RitualSparkJournalPageVersion5WidgetState();
}

class _RitualSparkJournalPageVersion5WidgetState
    extends State<RitualSparkJournalPageVersion5Widget> {
  late RitualSparkJournalPageVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RitualSparkJournalPageVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'RitualSparkJournalPageVersion5'});
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
                height: 872.8,
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
                  model: _model.journalPage1Version5Model,
                  updateCallback: () => safeSetState(() {}),
                  child: JournalPage1Version5Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
