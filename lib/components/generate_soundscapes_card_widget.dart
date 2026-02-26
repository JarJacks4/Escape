import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'generate_soundscapes_card_model.dart';
export 'generate_soundscapes_card_model.dart';

class GenerateSoundscapesCardWidget extends StatefulWidget {
  const GenerateSoundscapesCardWidget({super.key});

  @override
  State<GenerateSoundscapesCardWidget> createState() =>
      _GenerateSoundscapesCardWidgetState();
}

class _GenerateSoundscapesCardWidgetState
    extends State<GenerateSoundscapesCardWidget> {
  late GenerateSoundscapesCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenerateSoundscapesCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: 160.0,
        height: 103.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/download_(18).gif',
            ).image,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xC1EDF1F7), Color(0xD6F0831A)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Align(
            alignment: AlignmentDirectional(1.0, 1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.arrow_outward,
                        color: FlutterFlowTheme.of(context).alternate,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'GENERATE_SOUNDSCAPES_CARD_arrow_outward_');
                        logFirebaseEvent('IconButton_navigate_to');
                        unawaited(
                          () async {
                            context.pushNamed(
                              DestinationsUnrealEngineWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 9),
                                ),
                              },
                            );
                          }(),
                        );
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 20.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'nppdaile' /* Escape Worlds */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'The Seasons',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 1.0),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/ESCAPE_Logo_Clear.png',
                                width: 35.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
