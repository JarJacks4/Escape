import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'root_energy_center_comp_energy_guide_model.dart';
export 'root_energy_center_comp_energy_guide_model.dart';

/// New Component Gen
class RootEnergyCenterCompEnergyGuideWidget extends StatefulWidget {
  const RootEnergyCenterCompEnergyGuideWidget({super.key});

  @override
  State<RootEnergyCenterCompEnergyGuideWidget> createState() =>
      _RootEnergyCenterCompEnergyGuideWidgetState();
}

class _RootEnergyCenterCompEnergyGuideWidgetState
    extends State<RootEnergyCenterCompEnergyGuideWidget> {
  late RootEnergyCenterCompEnergyGuideModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RootEnergyCenterCompEnergyGuideModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: 300.0,
          height: 728.36,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x80EB1E1E), Color(0x58F0831A)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.anchor,
                      color: Colors.white,
                      size: 32.0,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'm9hiq3yt' /* Root Chakra */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'The Seasons',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '033pbugw' /* Muladhara */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'The Seasons',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            't8nfy8e8' /* Grounding & Security */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'WorkSans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '7kjiugjd' /* LOCATION */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'The Seasons',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'y2aq4ri1' /* Base of spine */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'WorkSans',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'p7t0v1h3' /* ELEMENT */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'The Seasons',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'lukfxozd' /* Earth */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'WorkSans',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'eszon4sq' /* The Root Chakra is your founda... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'WorkSans',
                        color: Colors.white,
                        letterSpacing: 0.0,
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
                          'ng5scz49' /* KEY PRACTICES */,
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'The Seasons',
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).error,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'rdjfsdnt' /* Grounding */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).error,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'gjqy3nnx' /* Walking Barefoot */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).error,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '5ve3zfic' /* Meditation */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: Color(0xA7E65454),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'fconzzxv' /* Root Affirmations */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.217,
                        height: 37.4,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).error,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 4.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'wsq7ixft' /* Body Awareness */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
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
                          'bjpviomw' /* BENEFITS */,
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'The Seasons',
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'ajzwsqjj' /* • Enhanced sense of security */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'WorkSans',
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'ecir2v57' /* • Improved physical vitality */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'WorkSans',
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'zcf42vev' /* • Greater stability and ground... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'WorkSans',
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'm8h985sk' /* • Reduced fear and anxiety */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'WorkSans',
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0x48E65454),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ykztuhcw' /* AFFIRMATION */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: Colors.white,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'h13uv8vw' /* "I am safe, secure, and ground... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
