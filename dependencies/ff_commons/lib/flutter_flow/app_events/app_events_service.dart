import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'app_events_base.dart';

class FFAppEventService {
  static final FFAppEventService _instance = FFAppEventService._internal();

  static FFAppEventService get instance => _instance;

  StreamController<FFAppEvent> _controller = StreamController<FFAppEvent>();
  StreamController<FFAppEvent> _localEventController =
      StreamController<FFAppEvent>.broadcast();
  Queue<FFAppEvent> _appEventQueue = Queue<FFAppEvent>();
  StreamSubscription<FFAppEvent>? _eventSubscription;
  Future<void> Function(FFAppEvent event)? _globalEventHandler;

  /// Stream for local events that can be subscribed to in any page
  Stream<FFAppEvent> get localEventsStream => _localEventController.stream;

  void init({required Future<void> Function(FFAppEvent event) onGlobalEvent}) {
    _globalEventHandler = onGlobalEvent;
    if (_controller.isClosed) {
      _controller = StreamController<FFAppEvent>();
      _localEventController = StreamController<FFAppEvent>.broadcast();
      _appEventQueue = Queue<FFAppEvent>();
    }
    _eventSubscription?.cancel();
    _eventSubscription = _controller.stream.listen((event) {
      _appEventQueue.add(event);
      if (_appEventQueue.length == 1) {
        _processNextAppEvent();
      }
    });
  }

  FFAppEventService._internal();

  void triggerAppEvent(FFAppEvent event) {
    if (_controller.isClosed) {
      if (kDebugMode) {
        debugPrint(
            'Event of type: ${event.runtimeType} was dropped because the stream is closed.');
      }
    } else {
      _controller.add(event);
    }
  }

  Future<void> _processNextAppEvent() async {
    while (_appEventQueue.isNotEmpty) {
      final event = _appEventQueue.first;

      if (event.scope == FFAppEventScope.GLOBAL) {
        if (event.waitForCompletion) {
          await _globalEventHandler!(
            event,
          );
        } else {
          _globalEventHandler!(
            event,
          );
        }
      } else if (event.scope == FFAppEventScope.LOCAL) {
        // Emit local events to the broadcast stream for targeted subscription
        if (!_localEventController.isClosed) {
          _localEventController.add(event);
        }
      }
      _appEventQueue.removeFirst();
    }
  }

  void closeAppEventStream() {
    _eventSubscription?.cancel();
    _eventSubscription = null;
    if (!_controller.isClosed) {
      _controller.close();
    }
    if (!_localEventController.isClosed) {
      _localEventController.close();
    }
    _appEventQueue.clear();
  }
}
