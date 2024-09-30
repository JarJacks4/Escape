import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:async';
import 'sounds_comp_widget.dart' show SoundsCompWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SoundsCompModel extends FlutterFlowModel<SoundsCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController1;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall1;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController3;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall3;

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController4;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewPagingController1?.dispose();
    listViewPagingController3?.dispose();
    listViewPagingController4?.dispose();
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
          listViewYouTubeDataAmbientSoundscapesAPICallPage1);
  }

  void listViewYouTubeDataAmbientSoundscapesAPICallPage1(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall1!(nextPageMarker)
          .then((listViewYouTubeDataAmbientSoundscapesAPICallResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataAmbientSoundscapesAPICallResponse.jsonBody,
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
                      listViewYouTubeDataAmbientSoundscapesAPICallResponse,
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
          listViewYouTubeDataPeacefulSoundsAPIFINALCopyPage3);
  }

  void listViewYouTubeDataPeacefulSoundsAPIFINALCopyPage3(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall3!(nextPageMarker)
          .then((listViewYouTubeDataPeacefulSoundsAPIFINALCopyResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataPeacefulSoundsAPIFINALCopyResponse
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
                      listViewYouTubeDataPeacefulSoundsAPIFINALCopyResponse,
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
          listViewYouTubeDataCitySoundscapesAPICallCopyPage4);
  }

  void listViewYouTubeDataCitySoundscapesAPICallCopyPage4(
          ApiPagingParams nextPageMarker) =>
      listViewApiCall4!(nextPageMarker)
          .then((listViewYouTubeDataCitySoundscapesAPICallCopyResponse) {
        final pageItems = (getJsonField(
                  listViewYouTubeDataCitySoundscapesAPICallCopyResponse
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
                      listViewYouTubeDataCitySoundscapesAPICallCopyResponse,
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
}
