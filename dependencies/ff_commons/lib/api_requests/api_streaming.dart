import 'dart:async';
import 'dart:convert';

class ServerSentEvent {
  final String id;
  final String event;
  final String data;
  late final dynamic _jsonData = _tryJsonDecode(data);
  final int? retry;

  dynamic get jsonData {
    return _jsonData;
  }

  dynamic _tryJsonDecode(String dataString) {
    try {
      return jsonDecode(dataString);
    } catch (_) {
      return null;
    }
  }

  ServerSentEvent({
    required this.id,
    required this.event,
    required this.data,
    this.retry,
  });
}

class ResponseStreamMessage {
  final String message;
  late final ServerSentEvent _serverSentEvent = _parseSseString(message);

  ServerSentEvent get serverSentEvent {
    return _serverSentEvent;
  }

  ResponseStreamMessage({
    required this.message,
  });
  ServerSentEvent _parseSseString(String sseString) {
    String id = '';
    String event = '';
    String data = '';
    int? retry;

    // Split the input string by lines
    final lines = sseString.split('\n');

    for (var line in lines) {
      if (line.startsWith('id:')) {
        id = line.substring(3).trim();
      } else if (line.startsWith('event:')) {
        event = line.substring(6).trim();
      } else if (line.startsWith('data:')) {
        data += line.substring(5).trim() + '\n';
      } else if (line.startsWith('retry:')) {
        retry = int.tryParse(line.substring(6).trim());
      }
    }

    // Remove the trailing newline character from data
    if (data.endsWith('\n')) {
      data = data.substring(0, data.length - 1);
    }

    return ServerSentEvent(id: id, event: event, data: data, retry: retry);
  }
}

class ServerSentEventLineTransformer
    extends StreamTransformerBase<String, String> {
  @override
  Stream<String> bind(Stream<String> stream) {
    return Stream<String>.eventTransformed(
      stream,
      (EventSink<String> sink) => _NewlineEventSink(sink),
    );
  }
}

class _NewlineEventSink implements EventSink<String> {
  final EventSink<String> _sink;
  String _buffer = '';

  _NewlineEventSink(this._sink);

  @override
  void add(String data) {
    if (data.isEmpty) {
      _sink.add(_buffer);
      _buffer = '';
    } else {
      _buffer += (_buffer.isNotEmpty ? '\n' : '') + data;
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    _sink.addError(error, stackTrace);
  }

  @override
  void close() {
    if (_buffer.isNotEmpty) {
      _sink.add(_buffer);
      _buffer = '';
    }
    _sink.close();
  }
}

