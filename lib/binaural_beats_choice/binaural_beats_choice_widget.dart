import '/components/binaural_beats_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'binaural_beats_choice_model.dart';
export 'binaural_beats_choice_model.dart';

class BinauralBeatsChoiceWidget extends StatefulWidget {
  const BinauralBeatsChoiceWidget({super.key});

  static String routeName = 'BinauralBeatsChoice';
  static String routePath = 'binauralBeatsChoice';

  @override
  State<BinauralBeatsChoiceWidget> createState() =>
      _BinauralBeatsChoiceWidgetState();
}

class _BinauralBeatsChoiceWidgetState extends State<BinauralBeatsChoiceWidget> {
  late BinauralBeatsChoiceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BinauralBeatsChoiceModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BinauralBeatsChoice'});
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
          child: wrapWithModel(
            model: _model.binauralBeatsChoiceCompModel,
            updateCallback: () => safeSetState(() {}),
            child: BinauralBeatsChoiceCompWidget(),
          ),
        ),
      ),
    );
  }
}
