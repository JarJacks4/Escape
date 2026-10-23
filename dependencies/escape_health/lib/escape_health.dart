// Escape Health — one Dart API over HealthKit (iOS) and Health Connect (Android).
//
// Everything is optional and read-mostly. The app asks only when the user taps a clear
// "Connect Apple Health / Health Connect" button (never on launch), explains why first, and
// keeps working if the answer is no. Nothing read here is uploaded unless the user also turned on
// the matching consent in Privacy & data.
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

@immutable
class HealthSnapshot {
  const HealthSnapshot({
    this.heartRate,
    this.heartRateAt,
    this.restingHeartRate,
    this.hrvMs,
    this.sleepMinutesLastNight,
    this.stepsToday,
  });

  /// Latest heart rate (bpm) in the last 2 hours, if any.
  final double? heartRate;
  final DateTime? heartRateAt;
  final double? restingHeartRate;

  /// HRV in milliseconds (iOS: SDNN, Android: RMSSD — shown as a trend, never compared across).
  final double? hrvMs;
  final int? sleepMinutesLastNight;
  final int? stepsToday;

  bool get isEmpty =>
      heartRate == null &&
      restingHeartRate == null &&
      hrvMs == null &&
      sleepMinutesLastNight == null &&
      stepsToday == null;

  factory HealthSnapshot.fromMap(Map m) {
    double? d(Object? v) => v is num ? v.toDouble() : null;
    int? i(Object? v) => v is num ? v.round() : null;
    final at = m['heartRateAt'];
    return HealthSnapshot(
      heartRate: d(m['heartRate']),
      heartRateAt: at is num ? DateTime.fromMillisecondsSinceEpoch(at.toInt()) : null,
      restingHeartRate: d(m['restingHeartRate']),
      hrvMs: d(m['hrvMs']),
      sleepMinutesLastNight: i(m['sleepMinutesLastNight']),
      stepsToday: i(m['stepsToday']),
    );
  }
}

enum HealthAvailability {
  /// HealthKit / Health Connect present and usable.
  available,

  /// Android: Health Connect app not installed or needs an update (call [EscapeHealth.openStore]).
  needsInstall,

  /// Not supported on this device (iPad without Health, web, desktop, old Android).
  unsupported,
}

class EscapeHealth {
  static const MethodChannel _ch = MethodChannel('escape_health');

  static Future<HealthAvailability> availability() async {
    if (kIsWeb) return HealthAvailability.unsupported;
    try {
      final s = await _ch.invokeMethod<String>('availability');
      return switch (s) {
        'available' => HealthAvailability.available,
        'needsInstall' => HealthAvailability.needsInstall,
        _ => HealthAvailability.unsupported,
      };
    } catch (_) {
      return HealthAvailability.unsupported;
    }
  }

  /// Shows the system permission sheet. Returns true if the sheet was shown and finished.
  /// (Apple never tells apps whether read access was granted; an empty snapshot means "no data".)
  static Future<bool> requestAuthorization() async {
    try {
      return await _ch.invokeMethod<bool>('requestAuthorization') ?? false;
    } catch (_) {
      return false;
    }
  }

  static Future<HealthSnapshot?> snapshot() async {
    try {
      final m = await _ch.invokeMethod<Map>('snapshot');
      return m == null ? null : HealthSnapshot.fromMap(m);
    } catch (_) {
      return null;
    }
  }

  /// iOS 18+: writes an Apple Health "State of Mind" (daily mood) sample.
  /// Android: no equivalent record type, returns false.
  /// [valence] is -1 (very unpleasant) … +1 (very pleasant).
  static Future<bool> logStateOfMind({required double valence, required String label}) async {
    try {
      return await _ch.invokeMethod<bool>(
              'logStateOfMind', {'valence': valence.clamp(-1.0, 1.0), 'label': label}) ??
          false;
    } catch (_) {
      return false;
    }
  }

  /// Saves Mindful Minutes (iOS) / a Mindfulness session (Android, Health Connect 1.1+).
  static Future<bool> logMindfulSession(
      {required DateTime start, required DateTime end, String title = 'Escape'}) async {
    try {
      return await _ch.invokeMethod<bool>('logMindfulSession', {
            'start': start.millisecondsSinceEpoch,
            'end': end.millisecondsSinceEpoch,
            'title': title,
          }) ??
          false;
    } catch (_) {
      return false;
    }
  }

  /// Android: opens the Play Store page for Health Connect.
  static Future<void> openStore() async {
    try {
      await _ch.invokeMethod('openStore');
    } catch (_) {}
  }
}
