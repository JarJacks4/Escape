import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/add_tab_bar_widget.dart';
import '/components/pilates_videos_comp/pilates_videos_comp_widget.dart';
import '/components/tai_chi_videos_comp/tai_chi_videos_comp_widget.dart';
import '/components/yoga_videos_comp/yoga_videos_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'dart:math';
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'tabbar_home_community_widget.dart' show TabbarHomeCommunityWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TabbarHomeCommunityModel
    extends FlutterFlowModel<TabbarHomeCommunityWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, VideosCollectionRecord>?
      listViewPagingController5;
  Query? listViewPagingQuery5;
  List<StreamSubscription?> listViewStreamSubscriptions5 = [];

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for YogaVideosComp component.
  late YogaVideosCompModel yogaVideosCompModel;
  // Model for PilatesVideosComp component.
  late PilatesVideosCompModel pilatesVideosCompModel;
  // Model for TaiChiVideosComp component.
  late TaiChiVideosCompModel taiChiVideosCompModel;

  @override
  void initState(BuildContext context) {
    yogaVideosCompModel = createModel(context, () => YogaVideosCompModel());
    pilatesVideosCompModel =
        createModel(context, () => PilatesVideosCompModel());
    taiChiVideosCompModel = createModel(context, () => TaiChiVideosCompModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    listViewStreamSubscriptions5.forEach((s) => s?.cancel());
    listViewPagingController5?.dispose();

    yogaVideosCompModel.dispose();
    pilatesVideosCompModel.dispose();
    taiChiVideosCompModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, VideosCollectionRecord>
      setListViewController5(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController5 ??= _createListViewController5(query, parent);
    if (listViewPagingQuery5 != query) {
      listViewPagingQuery5 = query;
      listViewPagingController5?.refresh();
    }
    return listViewPagingController5!;
  }

  PagingController<DocumentSnapshot?, VideosCollectionRecord>
      _createListViewController5(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, VideosCollectionRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryVideosCollectionRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions5,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
