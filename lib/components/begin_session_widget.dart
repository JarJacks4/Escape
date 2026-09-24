import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'begin_session_model.dart';
export 'begin_session_model.dart';

/// New Component Gen
class BeginSessionWidget extends StatefulWidget {
  const BeginSessionWidget({
    super.key,
    this.currentIndex,
  });

  final int? currentIndex;

  @override
  State<BeginSessionWidget> createState() => _BeginSessionWidgetState();
}

class _BeginSessionWidgetState extends State<BeginSessionWidget> {
  late BeginSessionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeginSessionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).height < 720.0;
    final verticalPadding = isCompact ? 24.0 : 60.0;
    final headerSpacing = isCompact ? 72.0 : 178.0;

    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsetsDirectional.fromSTEB(
          24.0,
          verticalPadding,
          24.0,
          verticalPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Color(0xFF2A3050),
                  borderRadius: 22.0,
                  borderWidth: 1.0,
                  buttonSize: 44.0,
                  fillColor: Color(0xFF1A2035),
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'BEGIN_SESSION_arrow_back_rounded_ICN_ON_');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.safePop();
                  },
                ),
              ],
            ),
            SizedBox(height: headerSpacing),
            Text(
              FFLocalizations.of(context).getText(
                'h5se0u3k' /* Move with the flow. */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'WorkSans',
                    color: Colors.white,
                    fontSize: isCompact ? 38.0 : 48.0,
                    letterSpacing: isCompact ? 10.0 : 15.0,
                    fontWeight: FontWeight.w200,
                    lineHeight: 1.1,
                  ),
            ),
            SizedBox(height: isCompact ? 36.0 : 52.0),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Material(
                color: Colors.transparent,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: Container(
                  width: double.infinity,
                  height: 76.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF0D1A2E),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15.0,
                        color: Color(0x9539519F),
                        offset: Offset(0.0, 2.0),
                        spreadRadius: 3.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(28.0),
                    border: Border.all(
                      color: Color(0xFF2A7A8A),
                      width: 0.5,
                    ),
                  ),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('BEGIN_SESSION_COMP_Btn_ON_TAP');
                      logFirebaseEvent('Btn_navigate_to');

                      context.pushNamed(
                        BodyVersion5MovementsPageWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      '5p7h5xgz' /* Begin  Session */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0x901C2444),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'WorkSans',
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 3.0,
                                fontWeight: FontWeight.w300,
                                lineHeight: 1.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Color(0xFF4B68C8),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                      hoverColor: Color(0x7939519F),
                      hoverBorderSide: BorderSide(
                        color: Color(0xFF6583E7),
                        width: 1.0,
                      ),
                      hoverElevation: 2.0,
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
