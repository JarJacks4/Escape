import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/lucille_suggestion_description_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import "package:that_slideable_list_item_mrpo3s/backend/schema/enums/enums.dart"
    as that_slideable_list_item_mrpo3s_enums;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'lucille_suggestions_widget.dart' show LucilleSuggestionsWidget;
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:that_audio_player_oo85ab/backend/api_requests/api_calls.dart'
    as that_audio_player_oo85ab_api_calls_util;
import 'package:that_slideable_list_item_mrpo3s/components/swipe_left_comp_widget.dart'
    as that_slideable_list_item_mrpo3s;
import 'package:that_slideable_list_item_mrpo3s/custom_code/widgets/index.dart'
    as that_slideable_list_item_mrpo3s_custom_widgets;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_commons/api_requests/api_streaming.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
