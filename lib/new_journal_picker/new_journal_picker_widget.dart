import '/components/journal_type_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:material_palette/material_palette.dart';
import 'new_journal_picker_model.dart';
export 'new_journal_picker_model.dart';

class NewJournalPickerWidget extends StatefulWidget {
  const NewJournalPickerWidget({super.key});

  static String routeName = 'NewJournalPicker';
  static String routePath = '/newJournalPicker';

  @override
  State<NewJournalPickerWidget> createState() => _NewJournalPickerWidgetState();
}

class _NewJournalPickerWidgetState extends State<NewJournalPickerWidget> {
  late NewJournalPickerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewJournalPickerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NewJournalPicker'});
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
                    'color0': Color(0xFFDDE5F4),
                    'color1': Color(0xFFB2C0E4),
                    'color2': Color(0xFFEDEAE2),
                    'color3': Color(0x00808080),
                    'color4': Color(0x00808080),
                    'color5': Color(0x00808080),
                    'color6': Color(0x00808080),
                    'color7': Color(0x00808080),
                    'color8': Color(0x00808080),
                    'color9': Color(0x00808080)
                  }),
                  animationMode: ShaderAnimationMode.continuous,
                  cache: false,
                );
              },
            ),
            SingleChildScrollView(
              primary: false,
              controller: _model.columnScrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 26.53,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 44.0,
                                  fillColor: Colors.transparent,
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 28.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'NEW_JOURNAL_PICKER_IconButton_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_haptic_feedback');
                                    HapticFeedback.heavyImpact();
                                    logFirebaseEvent(
                                        'IconButton_navigate_back');
                                    context.safePop();
                                  },
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '0aa32481' /* New Mental Health Journal */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.cormorantSc(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'u3qg9z4p' /* Choose how you'd like to refle... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.workSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                          Container(
                            height: 24.0,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(9999.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xD21C2444),
                                  borderRadius: BorderRadius.circular(9999.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Color(0x80FFFFFF),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Container(),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 32.0,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'NEW_JOURNAL_PICKER_JournalTypeCard_ON_TA');
                              logFirebaseEvent(
                                  'JournalTypeCard_haptic_feedback');
                              HapticFeedback.heavyImpact();
                              logFirebaseEvent('JournalTypeCard_navigate_to');

                              context.pushNamed(
                                ActiveVoiceJournalingWidget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 2),
                                  ),
                                },
                              );
                            },
                            child: wrapWithModel(
                              model: _model.journalTypeCardModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: JournalTypeCardWidget(
                                description:
                                    'Automatically create health journal by Voice & Face detection with AI',
                                icon: Icon(
                                  Icons.mic_rounded,
                                  size: 28.0,
                                ),
                                iconBg: FlutterFlowTheme.of(context).primary,
                                title: 'Voice Journal',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'NEW_JOURNAL_PICKER_JournalTypeCard_ON_TA');
                              logFirebaseEvent(
                                  'JournalTypeCard_haptic_feedback');
                              HapticFeedback.heavyImpact();
                              logFirebaseEvent('JournalTypeCard_navigate_to');

                              context.pushNamed(
                                TextJournalVersion5Widget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 2),
                                  ),
                                },
                              );
                            },
                            child: wrapWithModel(
                              model: _model.journalTypeCardModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: JournalTypeCardWidget(
                                description:
                                    'Set up manual text journal based on your current mood & conditions',
                                icon: Icon(
                                  Icons.edit_note_rounded,
                                  size: 28.0,
                                ),
                                iconBg: Color(0x7939519F),
                                title: 'Text Journal',
                              ),
                            ),
                          ),
                          Container(
                            height: 32.0,
                          ),
                          Container(
                            height: 200.0,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Lottie.asset(
                              'assets/jsons/Animation_-_1708891000222.json',
                              width: 293.9,
                              height: 210.6,
                              fit: BoxFit.contain,
                              animate: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                height: 79.02,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primaryBackground,
                      Color(0x00EDF1F7)
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, 1.0),
                    end: AlignmentDirectional(0, -1.0),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 40.0),
                  child: Container(
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: Image.asset(
                            'assets/images/Logo_ESCAPE_DarkBlue.png',
                          ).image,
                        ),
                      ),
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
