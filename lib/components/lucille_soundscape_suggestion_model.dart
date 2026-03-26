import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import 'lucille_soundscape_suggestion_widget.dart'
    show LucilleSoundscapeSuggestionWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class LucilleSoundscapeSuggestionModel
    extends FlutterFlowModel<LucilleSoundscapeSuggestionWidget> {
  ///  Local state fields for this component.

  String? soundscapeID;

  String? soundscapeTitle;

  String? soundscapeCategory;

  String? soundscapeDescription;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  AudioPlayer? soundPlayer1;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;

  /// Query cache managers for this widget.

  final _soundscapesCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> soundscapesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _soundscapesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSoundscapesCacheCache() => _soundscapesCacheManager.clear();
  void clearSoundscapesCacheCacheKey(String? uniqueKey) =>
      _soundscapesCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();

    /// Dispose query cache managers for this widget.

    clearSoundscapesCacheCache();
  }
}
