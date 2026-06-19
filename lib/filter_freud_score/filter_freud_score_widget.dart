import '/components/filter_freud_score_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'filter_freud_score_model.dart';
export 'filter_freud_score_model.dart';

class FilterFreudScoreWidget extends StatefulWidget {
  const FilterFreudScoreWidget({super.key});

  static String routeName = 'FilterFreudScore';
  static String routePath = '/filterFreudScore';

  @override
  State<FilterFreudScoreWidget> createState() => _FilterFreudScoreWidgetState();
}

class _FilterFreudScoreWidgetState extends State<FilterFreudScoreWidget> {
  late FilterFreudScoreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterFreudScoreModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FilterFreudScore'});
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
          child: Container(
            width: double.infinity,
            height: 852.0,
            decoration: BoxDecoration(
              color: Color(0xFFF5F0E8),
            ),
            child: wrapWithModel(
              model: _model.filterFreudScoreComponentModel,
              updateCallback: () => safeSetState(() {}),
              child: FilterFreudScoreComponentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
