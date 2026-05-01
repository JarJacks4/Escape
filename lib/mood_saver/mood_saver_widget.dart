import '/components/balance_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'mood_saver_model.dart';
export 'mood_saver_model.dart';

class MoodSaverWidget extends StatefulWidget {
  const MoodSaverWidget({super.key});

  static String routeName = 'MoodSaver';
  static String routePath = 'moodSaver';

  @override
  State<MoodSaverWidget> createState() => _MoodSaverWidgetState();
}

class _MoodSaverWidgetState extends State<MoodSaverWidget> {
  late MoodSaverModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodSaverModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MoodSaver'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        body: Container(
          width: double.infinity,
          height: 888.7,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/2d9f7a444427843a600a8391d24faf38.gif',
              ).image,
            ),
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).accent3,
                FlutterFlowTheme.of(context).secondaryText,
                FlutterFlowTheme.of(context).tertiary
              ],
              stops: [0.0, 0.5, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: wrapWithModel(
                  model: _model.balancePageModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BalancePageWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
