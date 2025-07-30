import 'package:flutter_flow/flutter_flow_custom_actions.dart';
import 'package:geocoding/geocoding.dart';

@FFCustomAction()
Future<String> getFormattedAddress({
  required double latitude,
  required double longitude,
}) async {
  try {
    final placemarks = await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      final p = placemarks.first;
      return '\${p.street}, \${p.locality}, \${p.administrativeArea}, \${p.postalCode}, \${p.country}';
    } else {
      return 'No address found';
    }
  } catch (e) {
    return 'Error: \${e.toString()}';
  }
}