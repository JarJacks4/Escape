import '/backend/api_requests/api_calls.dart';
import '/components/health_journal_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_palette/material_palette.dart';
import 'health_journal_model.dart';
export 'health_journal_model.dart';

class HealthJournalWidget extends StatefulWidget {
  const HealthJournalWidget({super.key});

  static String routeName = 'HealthJournal';
  static String routePath = '/healthJournal';

  @override
  State<HealthJournalWidget> createState() => _HealthJournalWidgetState();
}

class _HealthJournalWidgetState extends State<HealthJournalWidget> {
  late HealthJournalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthJournalModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HealthJournal'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HEALTH_JOURNAL_HealthJournal_ON_INIT_STA');
      logFirebaseEvent('HealthJournal_backend_call');
      _model.getActiveExercise =
          await LucilleTherapyExercisesGroup.getActiveExerciseCall.call();

      logFirebaseEvent('HealthJournal_backend_call');
      _model.listRecentSessions =
          await TheoryOfMindOnboardingGroup.userCompleteProfileCall.call();
    });
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
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return RadialTurbulenceGradientShaderFill(
                  width: constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : 200.0,
                  height: constraints.maxHeight.isFinite
                      ? constraints.maxHeight
                      : 200.0,
                  params: ShaderParams(values: {
                    'gradientCenterX': 0.5,
                    'gradientCenterY': 0.5,
                    'gradientScale': 2.03,
                    'gradientOffset': -0.02,
                    'noiseIntensity': 0.51,
                    'ditherStrength': 0.0,
                    'ditherScale': 1.0,
                    'animSpeed': 0.75,
                    'octaves': 3.02,
                    'baseFrequency': 1.94,
                    'noiseScale': 3.9,
                    'colorCount': 3.0,
                    'softness': 1.0,
                    'exposure': 1.0,
                    'contrast': 1.0,
                    'bumpStrength': 1.68,
                    'lightDirX': 0.17,
                    'lightDirY': 0.5,
                    'lightDirZ': 1.0,
                    'lightIntensity': 1.62,
                    'ambient': 0.67,
                    'specular': 0.06,
                    'shininess': 35.72,
                    'metallic': 0.0,
                    'roughness': 1.0,
                    'edgeFade': 2.3,
                    'edgeFadeMode': 1.0
                  }, colors: {
                    'color3': Color(0x00808080),
                    'color4': Color(0x00808080),
                    'color5': Color(0x00808080),
                    'color6': Color(0x00808080),
                    'color7': Color(0x00808080),
                    'color8': Color(0x00808080),
                    'color9': Color(0x00808080),
                    'color2': Color(0xEC8338CD),
                    'color1': FlutterFlowTheme.of(context).accent1,
                    'color0': Color(0x57EDF1F7)
                  }),
                  animationMode: ShaderAnimationMode.continuous,
                  cache: false,
                );
              },
            ),
            wrapWithModel(
              model: _model.healthJournalComponentModel,
              updateCallback: () => safeSetState(() {}),
              child: HealthJournalComponentWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
