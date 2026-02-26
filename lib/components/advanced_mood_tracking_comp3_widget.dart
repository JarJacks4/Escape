import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'advanced_mood_tracking_comp3_model.dart';
export 'advanced_mood_tracking_comp3_model.dart';

/// New Component Gen
class AdvancedMoodTrackingComp3Widget extends StatefulWidget {
  const AdvancedMoodTrackingComp3Widget({super.key});

  @override
  State<AdvancedMoodTrackingComp3Widget> createState() =>
      _AdvancedMoodTrackingComp3WidgetState();
}

class _AdvancedMoodTrackingComp3WidgetState
    extends State<AdvancedMoodTrackingComp3Widget> {
  late AdvancedMoodTrackingComp3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdvancedMoodTrackingComp3Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: SingleChildScrollView(
          controller: _model.columnController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'ADVANCED_MOOD_TRACKING_COMP3_arrow_back_');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.keyboard_control,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent1,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 32.0,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'qsftfjku' /* Session Complete */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'osyo7ge6' /* 2:34 PM */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'WorkSans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GradientText(
                      FFLocalizations.of(context).getText(
                        'anbg33dm' /* Beautiful work today! */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'WorkSans',
                                color: FlutterFlowTheme.of(context).warning,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      colors: [
                        FlutterFlowTheme.of(context).alternate,
                        FlutterFlowTheme.of(context).accent1
                      ],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '54g01uo0' /* You've taken meaningful steps ... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.trending_up,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'glhpo3zr' /* Your Emotional Check-in */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 12.0,
                                  height: 12.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'em3sbrpu' /* Mood */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            GradientText(
                              FFLocalizations.of(context).getText(
                                'nb6ec0da' /* Bittersweet */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              colors: [
                                FlutterFlowTheme.of(context).tertiary,
                                FlutterFlowTheme.of(context).alternate
                              ],
                              gradientDirection: GradientDirection.ltr,
                              gradientType: GradientType.linear,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 12.0,
                                  height: 12.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ceix23qm' /* Energy */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '70ifhalo' /* Steady */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 12.0,
                                  height: 12.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '90gft1bj' /* Focus */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'yuhr1ae0' /* Clear */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context).accent3,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 12.0,
                          height: 12.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'p28ssaoq' /* Today's Journey */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 16.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '28i6w44s' /* Gratitude reflection completed */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.air,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'wq1f0gmt' /* 5-minute breathing exercise */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent1,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.format_quote,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'mx1gxawu' /* Progress, not perfection, is t... */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '6wicti6j' /* — Your mindful companion */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'WorkSans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '2ei2ciax' /* What would help right now? */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'WorkSans',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.air,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '1054mbgr' /* Breathwork */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'iiwhke1f' /* 5-minute guided breathing */,
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
                                  ],
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'ftslohcv' /* 5 min */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 24.0,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'ydgnvhyq' /* Journal */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'w244glvz' /* Write about your feelings */,
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
                                  ],
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'vhjk6waj' /* 10 min */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/a3fd262b556877da7280b850d5b2fa52.gif',
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'u6akget3' /* Talk to Lucille */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'hnadgu8a' /* I'm here to listen and support */,
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
                                  ],
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'uuf83j00' /* Now */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: FFLocalizations.of(context).getText(
                    '4nvqjbtz' /* Continue Your Journey */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).warning,
                    textStyle: FlutterFlowTheme.of(context)
                        .titleMedium
                        .override(
                          fontFamily: 'WorkSans',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'wmyrv3dn' /* Maybe later */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'WorkSans',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ].divide(SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
