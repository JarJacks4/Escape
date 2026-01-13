import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'sacral_chakra_mood_comp_model.dart';
export 'sacral_chakra_mood_comp_model.dart';

/// New Component Gen
class SacralChakraMoodCompWidget extends StatefulWidget {
  const SacralChakraMoodCompWidget({super.key});

  @override
  State<SacralChakraMoodCompWidget> createState() =>
      _SacralChakraMoodCompWidgetState();
}

class _SacralChakraMoodCompWidgetState
    extends State<SacralChakraMoodCompWidget> {
  late SacralChakraMoodCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SacralChakraMoodCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Color(0x978B4513),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8.0,
                            color: Color(0xFF8B4513),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                            spreadRadius: 8.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color(0x97211105),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.add,
                          color: Color(0xFFFFA500),
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          thickness: 2.0,
                          indent: 20.0,
                          endIndent: 40.0,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'yfe70yq4' /* Creative Energy Center */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'The Seasons',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Container(
                          height: 28.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF8B4513),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 4.0, 8.0, 4.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'r9oy3qzy' /* Forgiveness */,
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
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    buttonSize: 40.0,
                    fillColor: Color(0xFF4A5568),
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'SACRAL_CHAKRA_MOOD_close_rounded_ICN_ON_');
                      logFirebaseEvent('IconButton_bottom_sheet');
                      Navigator.pop(context);
                    },
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
                        CircularPercentIndicator(
                          percent: 0.5,
                          radius: 60.0,
                          lineWidth: 12.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: Color(0xFFF0831A),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          center: Text(
                            FFLocalizations.of(context).getText(
                              'alkduwqo' /* 50% */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                              fontFamily: 'WorkSans',
                              color: FlutterFlowTheme.of(context).secondary,
                              letterSpacing: 0.0,
                              shadows: [
                                Shadow(
                                  color: Color(0x978B4513),
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 8.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '1oirffcz' /* Progress Level */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'WorkSans',
                              color: Color(0xFFA0AEC0),
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'q9o8prew' /* 65/ */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'The Seasons',
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'ehrbyqii' /* 100 */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'The Seasons',
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ].divide(SizedBox(width: 24.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF4A5568),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 8.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '133vqjtr' /* Overview */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'WorkSans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
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
                      'y2gogfbc' /* Why Lucille Thinks This */,
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'WorkSans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0x9D34495E),
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Color(0xC0EDF1F7),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
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
                                  color: Color(0xFFFFA500),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'w1ncm0t0' /* Creative activities noted in y... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: Color(0xFFA0AEC0),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 8.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFA500),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '5w2qerjp' /* Gentle emotional flow observed... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: Color(0xFFA0AEC0),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 8.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFA500),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'zv364i12' /* Balanced pleasure-seeking beha... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: Color(0xFFA0AEC0),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'uvb56g08' /* Interpretation */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'WorkSans',
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'mha43sy2' /* Your Creative Energy Center fl... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color: Color(0xFFA0AEC0),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'aqgaeum7' /* Suggested Actions */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'WorkSans',
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0x9D34495E),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xC0EDF1F7),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.auto_awesome,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'lvddf80w' /* Visit Creative World */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0x9D34495E),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color(0xC0EDF1F7),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.book_outlined,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '9xrw684h' /* Open Guided Journal */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
