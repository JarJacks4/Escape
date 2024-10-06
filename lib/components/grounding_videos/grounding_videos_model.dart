import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'grounding_videos_widget.dart' show GroundingVideosWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GroundingVideosModel extends FlutterFlowModel<GroundingVideosWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController2;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall2;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController3;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewPagingController1?.dispose();
    listViewPagingController2?.dispose();
    listViewPagingController3?.dispose();
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
      ..addPageRequestListener(listViewYouTubeDataGroundingFINALAPIPage1);
  }

  void listViewYouTubeDataGroundingFINALAPIPage1(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker)
          .then((listViewYouTubeDataGroundingFINALAPIResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataGroundingFINALAPIResponse.jsonBody,
                  r'''$.items[:].snippet''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController1?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewYouTubeDataGroundingFINALAPIResponse,
                )
              : null,
        );
      });

  PagingController<ApiPagingParams, dynamic> setListViewController2(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall2 = apiCall;
    return listViewPagingController2 ??= _createListViewController2(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController2(
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
      ..addPageRequestListener(listViewYouTubeDataQigongDataAPICallPage2);
  }

  void listViewYouTubeDataQigongDataAPICallPage2(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall2!(nextPageMarker)
          .then((listViewYouTubeDataQigongDataAPICallResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataQigongDataAPICallResponse.jsonBody,
                  r'''$.items[:].snippet''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController2?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewYouTubeDataQigongDataAPICallResponse,
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
      ..addPageRequestListener(listViewYouTubeDataBinauralBeatsAPICopyPage3);
  }

  void listViewYouTubeDataBinauralBeatsAPICopyPage3(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall3!(nextPageMarker)
          .then((listViewYouTubeDataBinauralBeatsAPICopyResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataBinauralBeatsAPICopyResponse.jsonBody,
                  r'''$.items[:].snippet''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController3?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewYouTubeDataBinauralBeatsAPICopyResponse,
                )
              : null,
        );
      });

  Future waitForOnePageForListView3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController3?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
