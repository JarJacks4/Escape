import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'crown_chakra_mood_scan_comp_model.dart';
export 'crown_chakra_mood_scan_comp_model.dart';

/// New Component Gen
class CrownChakraMoodScanCompWidget extends StatefulWidget {
  const CrownChakraMoodScanCompWidget({super.key});

  @override
  State<CrownChakraMoodScanCompWidget> createState() =>
      _CrownChakraMoodScanCompWidgetState();
}

class _CrownChakraMoodScanCompWidgetState
    extends State<CrownChakraMoodScanCompWidget> with TickerProviderStateMixin {
  late CrownChakraMoodScanCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrownChakraMoodScanCompModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 260.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 260.0.ms,
            duration: 390.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 260.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 260.0.ms,
            duration: 660.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 260.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 260.0.ms,
            duration: 1240.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 260.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 260.0.ms,
            duration: 1690.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xF30F1A3A),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
          child: SingleChildScrollView(
            controller: _model.columnController,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: 1.0,
                  indent: 100.0,
                  endIndent: 100.0,
                  color: FlutterFlowTheme.of(context).primary,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 40.0,
                      fillColor: Color(0xFF4A5568),
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'CROWN_CHAKRA_MOOD_SCAN_close_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_bottom_sheet');
                        Navigator.pop(context);
                      },
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 40.0),
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Color(0x6F6B46C1),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/download_(40)_(1).gif',
                            ).image,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8.0,
                              color: Color(0xFF6B46C1),
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                              spreadRadius: 5.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0x6F130C21),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'kh08trky' /* Purpose Energy 
Center */
                            ,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'WorkSans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF6B46C1),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 12.0, 8.0, 12.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '06663nfs' /* Eliminating Lack of Faith */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 8.0,
                                ),
                              ),
                              child: CircularPercentIndicator(
                                percent: 0.5,
                                radius: 60.0,
                                lineWidth: 12.0,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor: Color(0xFF6B46C1),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).alternate,
                                center: Text(
                                  FFLocalizations.of(context).getText(
                                    '6zh7a560' /* 50% */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '182pfn2v' /* Progress Level */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: Color(0xFFA0AEC0),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'vj3lm9c5' /* 88/ */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'hly4oynh' /* 100 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ].divide(SizedBox(width: 24.0)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF4A5568),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 20.0, 12.0, 20.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'xtikoarq' /* Overview */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'u7kh13m9' /* Why Lucille Thinks This */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'WorkSans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x3E6B46C1),
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: Color(0x7BEDF1F7),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 8.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF6B46C1),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'icgc5fxc' /* Heightened spiritual awareness... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: Color(0xFFD1D5DB),
                                          letterSpacing: 0.0,
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation1']!),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 8.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF6B46C1),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '9esfl8fr' /* Strong sense of connection to ... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: Color(0xFFD1D5DB),
                                          letterSpacing: 0.0,
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation2']!),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 8.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF6B46C1),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '81ue0y6a' /* Increased moments of insight a... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: Color(0xFFD1D5DB),
                                          letterSpacing: 0.0,
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation3']!),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '9avdbtip' /* Interpretation */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'WorkSans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'xeunklme' /* Your Purpose Energy Center is ... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color: Color(0xFFD1D5DB),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation4']!),
                  ].divide(SizedBox(height: 12.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'chuee8pe' /* Suggested Actions */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'WorkSans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0x3E6B46C1),
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Color(0x7BEDF1F7),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.explore,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'c7dzpmu6' /* Visit Purpose World */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
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
                                'CROWN_CHAKRA_MOOD_SCAN_Container_wmav07k');
                            logFirebaseEvent('Container_navigate_to');

                            context.pushNamed(
                              ADHDAndOverthinkingGoalWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 2),
                                ),
                              },
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0x3E6B46C1),
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color(0x7BEDF1F7),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.air,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'bp4j4jz7' /* Start Brainwave Music Exercise */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
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
                                'CROWN_CHAKRA_MOOD_SCAN_Container_j0wrs0u');
                            logFirebaseEvent('Container_navigate_to');

                            context.pushNamed(
                              RitualSparkJournalPageVersion5Widget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 2),
                                ),
                              },
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0x3E6B46C1),
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color(0xA2EDF1F7),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.book,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'y1vhiwmd' /* Open Guided Journal */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
