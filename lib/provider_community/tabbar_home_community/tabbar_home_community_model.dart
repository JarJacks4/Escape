import '/backend/api_requests/api_calls.dart';
import '/components/pilates_videos_comp/pilates_videos_comp_widget.dart';
import '/components/tai_chi_videos_comp/tai_chi_videos_comp_widget.dart';
import '/components/yoga_videos_comp/yoga_videos_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
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

class TabbarHomeCommunityModel
    extends FlutterFlowModel<TabbarHomeCommunityWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController5;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall5;

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
    listViewPagingController5?.dispose();
    yogaVideosCompModel.dispose();
    pilatesVideosCompModel.dispose();
    taiChiVideosCompModel.dispose();
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController5(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall5 = apiCall;
    return listViewPagingController5 ??= _createListViewController5(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController5(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewYouTubeDataAPIBasePage5);
  }

  void listViewYouTubeDataAPIBasePage5(ApiPagingParams nextPageMarker) =>
      listViewApiCall5!(nextPageMarker)
          .then((listViewYouTubeDataAPIBaseResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataAPIBaseResponse.jsonBody,
                  r'''$.resource.videoId''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController5?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewYouTubeDataAPIBaseResponse,
                )
              : null,
        );
      });

  Future waitForOnePageForListView5({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController5?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
