import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'soundscape_sample_model.dart';
export 'soundscape_sample_model.dart';

class SoundscapeSampleWidget extends StatefulWidget {
  const SoundscapeSampleWidget({super.key});

  static String routeName = 'SoundscapeSample';
  static String routePath = 'soundscapeSample';

  @override
  State<SoundscapeSampleWidget> createState() => _SoundscapeSampleWidgetState();
}

class _SoundscapeSampleWidgetState extends State<SoundscapeSampleWidget> {
  late SoundscapeSampleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoundscapeSampleModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SoundscapeSample'});
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
            children: [],
          ),
        ),
      ),
    );
  }
}
