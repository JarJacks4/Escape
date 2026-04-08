import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_profile_goals_model.dart';
export 'create_profile_goals_model.dart';

class CreateProfileGoalsWidget extends StatefulWidget {
  const CreateProfileGoalsWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  final String? title;
  final Widget? icon;
  final Color? color;

  @override
  State<CreateProfileGoalsWidget> createState() =>
      _CreateProfileGoalsWidgetState();
}

class _CreateProfileGoalsWidgetState extends State<CreateProfileGoalsWidget> {
  late CreateProfileGoalsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProfileGoalsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<confetti_modualo_library_b75kfy_app_state.FFAppState>();
    context.watch<that_audio_player_oo85ab_app_state.FFAppState>();

    return Align(
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('CREATE_PROFILE_GOALS_Container_9syv0cus_');
          logFirebaseEvent('Container_update_component_state');
          _model.selfCareGoals = !_model.selfCareGoals;
          safeSetState(() {});
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: 417.4,
            height: MediaQuery.sizeOf(context).height * 0.251,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 50.0,
                  color: Color(0x8CD0E3F7),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                  spreadRadius: 5.0,
                )
              ],
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.transparent,
                width: 1.0,
              ),
            ),
            child: GridView(
              padding: EdgeInsets.fromLTRB(
                0,
                10.0,
                0,
                0,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 1.0,
              ),
              scrollDirection: Axis.vertical,
              children: [
                Builder(
                  builder: (context) {
                    final goals = FFAppState().OnboardingGoals.toList();

                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: goals.length,
                      separatorBuilder: (_, __) => SizedBox(width: 20.0),
                      itemBuilder: (context, goalsIndex) {
                        final goalsItem = goals[goalsIndex];
                        return Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.316,
                            height: MediaQuery.sizeOf(context).height * 0.159,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppConstants.OnboardingGoalColors.firstOrNull,
                                Color(0x9CD0E3F7),
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  _model.selfCareGoals
                                      ? Color(0x98EDF1F7)
                                      : Color(0x6ED0E3F7),
                                  Color(0xA2EDF1F7),
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 24.0, 12.0, 24.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Material(
                                            color: Colors.transparent,
                                            elevation: 3.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Container(
                                              width: 60.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0x9839519F),
                                                    Color(0xA6D0E3F7)
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: Color(0x79EDF1F7),
                                                ),
                                              ),
                                              child: widget!.icon!,
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              FFAppConstants
                                                  .OnboardingGoalsTitle
                                                  .firstOrNull,
                                              'Meditation',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'WorkSans',
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.normal,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 12.0)),
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: Offset(55.0, -55.0),
                                      child: Visibility(
                                        visible: _model.selfCareGoals,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 15.0, 0.0),
                                          child: Icon(
                                            Icons.check_circle,
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
