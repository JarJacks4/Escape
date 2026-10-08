import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

typedef SoundscapesTokenProvider = Future<String?> Function();
typedef SoundscapesExitHandler = void Function(String? tab);
typedef SoundscapesFeedbackHandler = Future<void> Function(Map<String, dynamic> feedback);

/// Opens the native Soundscapes module (iOS 17+ only).
class EscapeSoundscapes {
  static const MethodChannel _channel = MethodChannel('escape_soundscapes');
  static SoundscapesTokenProvider? _tokenProvider;
  static SoundscapesExitHandler? _onExit;
  static SoundscapesFeedbackHandler? _onFeedback;
  static bool _handlerSet = false;

  /// Call once (e.g. in main) before [open].
  static void configure({
    SoundscapesTokenProvider? tokenProvider,
    SoundscapesExitHandler? onExit,
    SoundscapesFeedbackHandler? onFeedback,
  }) {
    _tokenProvider = tokenProvider;
    _onExit = onExit;
    _onFeedback = onFeedback;
    if (!_handlerSet) {
      _channel.setMethodCallHandler(_handle);
      _handlerSet = true;
    }
  }

  static Future<dynamic> _handle(MethodCall call) async {
    switch (call.method) {
      case 'getIdToken':
        try {
          return await _tokenProvider?.call();
        } catch (_) {
          return null;
        }
      case 'onExit':
        _onExit?.call(call.arguments as String?);
        return null;
      case 'sendFeedback':
        final handler = _onFeedback;
        if (handler == null) {
          throw PlatformException(code: 'no_handler', message: 'Feedback is not set up');
        }
        await handler(Map<String, dynamic>.from(call.arguments as Map));
        return true;
    }
    return null;
  }

  /// True on iOS 17+.
  static Future<bool> isSupported() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) return false;
    try {
      return await _channel.invokeMethod<bool>('isSupported') ?? false;
    } catch (_) {
      return false;
    }
  }

  /// [mock] uses the bundled Figma data; otherwise [baseUrl] is the Soundscapes API.
  /// [screen]/[sheet] use the Figma names, e.g. "NowPlaying", "MoodField".
  static Future<void> open({
    bool mock = true,
    String? baseUrl,
    String? screen,
    String? sheet,
  }) {
    return _channel.invokeMethod('open', {
      'mock': mock,
      'baseUrl': baseUrl,
      'screen': screen,
      'sheet': sheet,
    });
  }

  static Future<void> close() => _channel.invokeMethod('close');
}
