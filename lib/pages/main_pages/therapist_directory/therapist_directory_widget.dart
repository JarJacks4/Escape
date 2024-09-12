import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'therapist_directory_model.dart';
export 'therapist_directory_model.dart';

class TherapistDirectoryWidget extends StatefulWidget {
  /// Page for Therapists Directory of Escape
  const TherapistDirectoryWidget({super.key});

  @override
  State<TherapistDirectoryWidget> createState() =>
      _TherapistDirectoryWidgetState();
}

class _TherapistDirectoryWidgetState extends State<TherapistDirectoryWidget> {
  late TherapistDirectoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TherapistDirectoryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TherapistDirectory'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: FlutterFlowGoogleMap(
                controller: _model.therapistDirectoryMapsController,
                onCameraIdle: (latLng) => safeSetState(
                    () => _model.therapistDirectoryMapsCenter = latLng),
                initialLocation: _model.therapistDirectoryMapsCenter ??=
                    currentUserLocationValue!,
                markers: FFAppState()
                    .TherapistLocation
                    .map(
                      (marker) => FlutterFlowMarker(
                        marker.serialize(),
                        marker,
                      ),
                    )
                    .toList(),
                markerColor: GoogleMarkerColor.rose,
                mapType: MapType.satellite,
                style: GoogleMapStyle.silver,
                initialZoom: 10.0,
                allowInteraction: true,
                allowZoom: true,
                showZoomControls: true,
                showLocation: true,
                showCompass: true,
                showMapToolbar: true,
                showTraffic: true,
                centerMapOnMarkerTap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
