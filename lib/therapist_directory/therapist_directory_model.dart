import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'therapist_directory_widget.dart' show TherapistDirectoryWidget;
import 'package:flutter/material.dart';

class TherapistDirectoryModel
    extends FlutterFlowModel<TherapistDirectoryWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
