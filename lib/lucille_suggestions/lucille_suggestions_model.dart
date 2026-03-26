import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'lucille_suggestions_widget.dart' show LucilleSuggestionsWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class LucilleSuggestionsModel
    extends FlutterFlowModel<LucilleSuggestionsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  // Stores action output result for [Backend Call - API (Recommended Soundscapes)] action in ThatSlideableWidget widget.
  ApiCallResponse? recommendedSoundscapes;
  // Stores action output result for [Backend Call - API (Get Soundscape)] action in ThatSlideableWidget widget.
  ApiCallResponse? getSoundscape;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  // Stores action output result for [Backend Call - API (Recommended Soundscapes)] action in ThatSlideableWidget widget.
  ApiCallResponse? recommendedSoundscapes8;
  // Stores action output result for [Backend Call - API (Get Soundscape)] action in ThatSlideableWidget widget.
  ApiCallResponse? getSoundscape4;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  // Stores action output result for [Backend Call - API (Recommended Soundscapes)] action in ThatSlideableWidget widget.
  ApiCallResponse? recommendedSoundscapes3;
  // Stores action output result for [Backend Call - API (Get Soundscape)] action in ThatSlideableWidget widget.
  ApiCallResponse? getSoundscape3;

  /// Query cache managers for this widget.

  final _suggestionCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> suggestionCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _suggestionCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSuggestionCacheCache() => _suggestionCacheManager.clear();
  void clearSuggestionCacheCacheKey(String? uniqueKey) =>
      _suggestionCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearSuggestionCacheCache();
  }
}
