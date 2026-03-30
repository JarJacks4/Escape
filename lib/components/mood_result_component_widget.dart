import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'mood_result_component_model.dart';
export 'mood_result_component_model.dart';

/// New Component Gen
class MoodResultComponentWidget extends StatefulWidget {
  const MoodResultComponentWidget({super.key});

  @override
  State<MoodResultComponentWidget> createState() =>
      _MoodResultComponentWidgetState();
}

class _MoodResultComponentWidgetState extends State<MoodResultComponentWidget> {
  late MoodResultComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodResultComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
      child: SingleChildScrollView(
        primary: false,
        controller: _model.columnController,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '0u4tm8u8' /* Your Mood */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'WorkSans',
                          color: FlutterFlowTheme.of(context).secondary,
                          letterSpacing: 3.0,
                          fontWeight: FontWeight.w300,
                          lineHeight: 1.0,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'jffh9p1g' /* Scan complete */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
                    child: Container(
                      width: 160.0,
                      height: 160.0,
                      decoration: BoxDecoration(
                        color: Color(0x1A4DFFD0),
                        borderRadius: BorderRadius.circular(80.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).tertiary,
                          width: 2.0,
                        ),
                      ),
                      child: Container(
                        width: 140.0,
                        height: 140.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 12.0,
                              color: Color(0x87397B9F),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                              spreadRadius: 10.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(70.0),
                          border: Border.all(
                            color: Color(0xFF97DAEF),
                            width: 3.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x7A1C2444),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'feuhc7z4' /* MOOD TODAY */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'iti28a2p' /* Focused */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).displayMedium.override(
                                  fontFamily: 'The Seasons',
                                  color: Color(0xFF5B73C2),
                                  fontSize: 36.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w300,
                                ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: Color(0x7F1C2444),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.bolt_rounded,
                                          color: Color(0xFF3DCDE4),
                                          size: 16.0,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'eh1wn0fb' /* Energy Level */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'WorkSans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 6.0)),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '5mksotcm' /* Moderate */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 6.0)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: Color(0x7F1C2444),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.favorite_border_rounded,
                                          color: Color(0xFFA684FF),
                                          size: 16.0,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'dlqia1av' /* Stress Level */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'WorkSans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 6.0)),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '7w9h8oig' /* Moderate */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 6.0)),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ].divide(SizedBox(height: 13.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 27.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '9uyk2s5n' /* RECOMMENDED FOR YOU */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'WorkSans',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w500,
                          lineHeight: 2.0,
                        ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: Color(0x801C2444),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Color(0x771C2444),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x6B2D6276),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                    spreadRadius: 4.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.air_rounded,
                                  color: Color(0xFFB090F5),
                                  size: 28.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'j33atj6h' /* Breathing Exercise */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                        lineHeight: 2.0,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'x3a7ut2x' /* 5 min guided breathwork */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'MOOD_RESULT_COMPONENT_SCAN_AGAIN_BTN_ON_');
                      logFirebaseEvent('Button_navigate_back');
                      context.safePop();
                    },
                    text: FFLocalizations.of(context).getText(
                      '7tfl8ijm' /* Scan Again */,
                    ),
                    options: FFButtonOptions(
                      width: 166.0,
                      height: 59.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0x771C2444),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'WorkSans',
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(22.0),
                      hoverColor: Color(0x6039519F),
                      hoverBorderSide: BorderSide(
                        color: Color(0xB239519F),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('MOOD_RESULT_COMPONENT_HOME_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(LucilleBody1PageWidget.routeName);
                    },
                    text: FFLocalizations.of(context).getText(
                      'lkz6f17s' /* Home */,
                    ),
                    icon: Icon(
                      FFIcons.khomeHouse2,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: 166.0,
                      height: 59.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0x771C2444),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'WorkSans',
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(22.0),
                      hoverColor: Color(0x6039519F),
                      hoverBorderSide: BorderSide(
                        color: Color(0xB239519F),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 22.0)),
              ),
            ),
          ].divide(SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
