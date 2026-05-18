import '/components/journal_page1_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'ritual_spark_journal_page_version5_model.dart';
export 'ritual_spark_journal_page_version5_model.dart';

class RitualSparkJournalPageVersion5Widget extends StatefulWidget {
  const RitualSparkJournalPageVersion5Widget({super.key});

  static String routeName = 'RitualSparkJournalPageVersion5';
  static String routePath = '/ritualSparkJournalPageVersion5';

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 872.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)_(2).gif',
                  ).image,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 60.0,
                    sigmaY: 60.0,
                  ),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x2DEDF1F7),
                          Color(0x58D0E3F7),
                          Color(0x8CFCC462)
                        ],
                        stops: [0.0, 0.5, 1.0],
                        begin: AlignmentDirectional(1.0, -0.64),
                        end: AlignmentDirectional(-1.0, 0.64),
                      ),
                    ),
                    child: wrapWithModel(
                      model: _model.journalPage1Version5Model,
                      updateCallback: () => safeSetState(() {}),
                      child: JournalPage1Version5Widget(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
