import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'delete_account_bottom_sheet_model.dart';
export 'delete_account_bottom_sheet_model.dart';

class DeleteAccountBottomSheetWidget extends StatefulWidget {
  const DeleteAccountBottomSheetWidget({super.key});

  @override
  State<DeleteAccountBottomSheetWidget> createState() =>
      _DeleteAccountBottomSheetWidgetState();
}

class _DeleteAccountBottomSheetWidgetState
    extends State<DeleteAccountBottomSheetWidget> {
  late DeleteAccountBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteAccountBottomSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 14),
        curve: Curves.easeIn,
        width: double.infinity,
        height: 497.92,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).black,
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x3B1D2429),
              offset: Offset(
                0.0,
                -3.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'xgv3a5z3' /* Are you sure you would like to... */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('DELETE_ACCOUNT_BOTTOM_SHEET_YES_BTN_ON_T');
                  logFirebaseEvent('Button_haptic_feedback');
                  HapticFeedback.heavyImpact();
                  logFirebaseEvent('Button_play_sound');
                  _model.soundPlayer1 ??= AudioPlayer();
                  if (_model.soundPlayer1!.playing) {
                    await _model.soundPlayer1!.stop();
                  }
                  _model.soundPlayer1!.setVolume(1.0);
                  _model.soundPlayer1!
                      .setAsset(
                          'assets/audios/ES_Game_Over,_Defeat,_Loss,_Negative,_Notification_01_-_Epidemic_Sound.mp3')
                      .then((_) => _model.soundPlayer1!.play());

                  logFirebaseEvent('Button_backend_call');
                  _model.deleteUser = await TheoryOfMindOnboardingGroup
                      .deleteUserProfileCall
                      .call(
                    userID: currentUserUid,
                  );

                  logFirebaseEvent('Button_auth');
                  await authManager.deleteUser(context);

                  context.goNamedAuth(
                      HomeVersion5Widget.routeName, context.mounted);

                  safeSetState(() {});
                },
                text: FFLocalizations.of(context).getText(
                  's7vfwprx' /* Yes */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).error,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'The Seasons',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Color(0x48EDF1F7),
                    width: 1.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'DELETE_ACCOUNT_BOTTOM_SHEET_NO_BTN_ON_TA');
                    logFirebaseEvent('Button_haptic_feedback');
                    HapticFeedback.lightImpact();
                    logFirebaseEvent('Button_play_sound');
                    _model.soundPlayer2 ??= AudioPlayer();
                    if (_model.soundPlayer2!.playing) {
                      await _model.soundPlayer2!.stop();
                    }
                    _model.soundPlayer2!.setVolume(1.0);
                    _model.soundPlayer2!
                        .setAsset(
                            'assets/audios/ES_Notification,_Attention,_Short_Phrase,_Positive_Achievement,_Win,_Video_Game_01_-_Epidemic_Sound.mp3')
                        .then((_) => _model.soundPlayer2!.play());

                    logFirebaseEvent('Button_bottom_sheet');
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'd1xmdcjr' /* No */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).accent1,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'The Seasons',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Color(0x4CEDF1F7),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Logo_ESCAPE_White.png',
                    width: 200.0,
                    height: 64.47,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
