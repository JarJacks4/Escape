// ignore_for_file: constant_identifier_names

/// Scope of where the event is being handled
enum FFAppEventScope {
  /// Event is being handled in the global scope
  GLOBAL,
  /// Event is being handled in the local scope
  LOCAL,
}

/// Base event class that all specific events inherit from
abstract class FFAppEvent {
  final DateTime timestamp;
  final String? debugId;
  final bool waitForCompletion;
  final FFAppEventScope scope;

  const FFAppEvent({
    required this.timestamp,
    required this.scope,
    this.debugId,
    this.waitForCompletion = true,
  });
}
