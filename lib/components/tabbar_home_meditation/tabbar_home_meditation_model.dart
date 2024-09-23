import '/backend/api_requests/api_calls.dart';
import '/components/anxiety_meditations_comp/anxiety_meditations_comp_widget.dart';
import '/components/meditation_help_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:async';
import 'tabbar_home_meditation_widget.dart' show TabbarHomeMeditationWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TabbarHomeMeditationModel
    extends FlutterFlowModel<TabbarHomeMeditationWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for AnxietyMeditationsComp component.
  late AnxietyMeditationsCompModel anxietyMeditationsCompModel;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController3;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall3;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController4;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall4;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController5;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall5;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController7;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall7;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController8;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall8;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController9;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall9;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController11;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall11;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController12;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall12;

  @override
  void initState(BuildContext context) {
    anxietyMeditationsCompModel =
        createModel(context, () => AnxietyMeditationsCompModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    anxietyMeditationsCompModel.dispose();
    listViewPagingController1?.dispose();
    listViewPagingController3?.dispose();
    listViewPagingController4?.dispose();
    listViewPagingController5?.dispose();
    listViewPagingController7?.dispose();
    listViewPagingController8?.dispose();
    listViewPagingController9?.dispose();
    listViewPagingController11?.dispose();
    listViewPagingController12?.dispose();
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController1(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall1 = apiCall;
    return listViewPagingController1 ??= _createListViewController1(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController1(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(
          listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALPage1);
  }

  void listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALPage1(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker).then(
          (listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALResponse
                      .jsonBody,
                  r'''$.items[:].snippet''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse:
                      listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewController3(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall3 = apiCall;
    return listViewPagingController3 ??= _createListViewController3(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController3(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(
          listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALPage3);
  }

  void listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALPage3(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall3!(nextPageMarker).then(
          (listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALResponse
                      .jsonBody,
                  r'''$.items[:].snippet''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController3?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse:
                      listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewController4(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall4 = apiCall;
    return listViewPagingController4 ??= _createListViewController4(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController4(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(
          listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALPage4);
  }

  void listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALPage4(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall4!(nextPageMarker).then(
          (listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALResponse
                      .jsonBody,
                  r'''$.items[:].snippet''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController4?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse:
                      listViewYouTubeDataStressAndAnxietyMeditationsAPIFINALResponse,
                )
              : null,
        );
      });

  Future waitForOnePageForListView4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController4?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

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
    return controller
      ..addPageRequestListener(
          listViewYouTubeDataSleepMeditationsAPIFINALCopyCopyCopyPage5);
  }

  void listViewYouTubeDataSleepMeditationsAPIFINALCopyCopyCopyPage5(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall5!(nextPageMarker).then(
          (listViewYouTubeDataSleepMeditationsAPIFINALCopyCopyCopyResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataSleepMeditationsAPIFINALCopyCopyCopyResponse
                      .jsonBody,
                  r'''$.items[:].snippet''',
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
                  lastResponse:
                      listViewYouTubeDataSleepMeditationsAPIFINALCopyCopyCopyResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewController7(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall7 = apiCall;
    return listViewPagingController7 ??= _createListViewController7(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController7(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(
          listViewYouTubeDataSleepMeditationsAPIFINALCopyCopyCopyPage7);
  }

  void listViewYouTubeDataSleepMeditationsAPIFINALCopyCopyCopyPage7(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall7!(nextPageMarker).then(
          (listViewYouTubeDataSleepMeditationsAPIFINALCopyCopyCopyResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataSleepMeditationsAPIFINALCopyCopyCopyResponse
                      .jsonBody,
                  r'''$.items[:].snippet''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController7?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse:
                      listViewYouTubeDataSleepMeditationsAPIFINALCopyCopyCopyResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewController8(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall8 = apiCall;
    return listViewPagingController8 ??= _createListViewController8(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController8(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(listViewYouTubeDataAPIGuidedMeditationsPage8);
  }

  void listViewYouTubeDataAPIGuidedMeditationsPage8(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall8!(nextPageMarker)
          .then((listViewYouTubeDataAPIGuidedMeditationsResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataAPIGuidedMeditationsResponse.jsonBody,
                  r'''$.items[:].snippet''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController8?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewYouTubeDataAPIGuidedMeditationsResponse,
                )
              : null,
        );
      });

  Future waitForOnePageForListView8({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController8?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController9(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall9 = apiCall;
    return listViewPagingController9 ??= _createListViewController9(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController9(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(listViewYouTubeDataGroundingFINALAPIPage9);
  }

  void listViewYouTubeDataGroundingFINALAPIPage9(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall9!(nextPageMarker)
          .then((listViewYouTubeDataGroundingFINALAPIResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataGroundingFINALAPIResponse.jsonBody,
                  r'''$.items[:].snippet''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController9?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewYouTubeDataGroundingFINALAPIResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewController11(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall11 = apiCall;
    return listViewPagingController11 ??= _createListViewController11(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController11(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(listViewYouTubeDataGroundingFINALAPIPage11);
  }

  void listViewYouTubeDataGroundingFINALAPIPage11(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall11!(nextPageMarker)
          .then((listViewYouTubeDataGroundingFINALAPIResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataGroundingFINALAPIResponse.jsonBody,
                  r'''$.items[:].snippet''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController11?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewYouTubeDataGroundingFINALAPIResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewController12(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall12 = apiCall;
    return listViewPagingController12 ??= _createListViewController12(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController12(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(listViewYouTubeDataAPIGuidedMeditationsPage12);
  }

  void listViewYouTubeDataAPIGuidedMeditationsPage12(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall12!(nextPageMarker)
          .then((listViewYouTubeDataAPIGuidedMeditationsResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataAPIGuidedMeditationsResponse.jsonBody,
                  r'''$.items[:].snippet''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController12?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewYouTubeDataAPIGuidedMeditationsResponse,
                )
              : null,
        );
      });

  Future waitForOnePageForListView12({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController12?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
