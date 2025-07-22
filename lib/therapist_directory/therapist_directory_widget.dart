import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:chat_u_i_kit_n2m29m/app_state.dart'
    as chat_u_i_kit_n2m29m_app_state;
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'therapist_directory_model.dart';
export 'therapist_directory_model.dart';

class TherapistDirectoryWidget extends StatefulWidget {
  const TherapistDirectoryWidget({super.key});

  static String routeName = 'TherapistDirectory';
  static String routePath = '/therapistDirectory';

  @override
  State<TherapistDirectoryWidget> createState() =>
      _TherapistDirectoryWidgetState();
}

class _TherapistDirectoryWidgetState extends State<TherapistDirectoryWidget>
    with TickerProviderStateMixin {
  late TherapistDirectoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TherapistDirectoryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TherapistDirectory'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('THERAPIST_DIRECTORY_TherapistDirectory_O');
      logFirebaseEvent('TherapistDirectory_request_permissions');
      await requestPermission(locationPermission);
      logFirebaseEvent('TherapistDirectory_launch_map');
      await launchMap(
        mapType: $ml.MapType.google,
        location: _model.googleMapsCenter,
        title: 'Nearby Therapists',
      );
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<chat_u_i_kit_n2m29m_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  leading: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 15.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderRadius: 12.0,
                      borderWidth: 1.0,
                      buttonSize: 85.0,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        color: FlutterFlowTheme.of(context).accent1,
                        size: 28.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'THERAPIST_DIRECTORY_arrow_back_sharp_ICN');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      '78zq08uv' /* Find a Therapist */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'The Seasons',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0.0,
                ),
              )
            : null,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x1A000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ofxwogkm' /* Therapists Near You */,
                  ),
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'WorkSans',
                        color: FlutterFlowTheme.of(context).alternate,
                        fontSize: 26.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
              ),
            ),
            Flexible(
              flex: 1,
              child: AuthUserStreamWidget(
                builder: (context) => FlutterFlowGoogleMap(
                  controller: _model.googleMapsController,
                  onCameraIdle: (latLng) =>
                      safeSetState(() => _model.googleMapsCenter = latLng),
                  initialLocation: _model.googleMapsCenter ??=
                      currentUserDocument!.location!,
                  markers: FFAppState()
                      .TherapistLocation
                      .map(
                        (marker) => FlutterFlowMarker(
                          marker.serialize(),
                          marker,
                        ),
                      )
                      .toList(),
                  markerColor: GoogleMarkerColor.azure,
                  mapType: MapType.normal,
                  style: GoogleMapStyle.dark,
                  initialZoom: 14.0,
                  allowInteraction: true,
                  allowZoom: true,
                  showZoomControls: true,
                  showLocation: true,
                  showCompass: true,
                  showMapToolbar: true,
                  showTraffic: true,
                  centerMapOnMarkerTap: true,
                  mapTakesGesturePreference: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
