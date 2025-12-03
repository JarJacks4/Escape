import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'community_home_f_i_n_a_l_widget.dart' show CommunityHomeFINALWidget;
import 'package:ff_commons/api_requests/api_paging_params.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommunityHomeFINALModel
    extends FlutterFlowModel<CommunityHomeFINALWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Partner Token Epidemic Sound)] action in CommunityHomeFINAL widget.
  ApiCallResponse? partnerToken;
  // Stores action output result for [Backend Call - API (Get Epidemic Tracks)] action in CommunityHomeFINAL widget.
  ApiCallResponse? getTracks;
  // Stores action output result for [Backend Call - API (Epidemic Stream URL)] action in CommunityHomeFINAL widget.
  ApiCallResponse? getUrlStreams;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController6;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall6;

  // State field(s) for Row widget.
  ScrollController? rowController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController = ScrollController();
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    columnController?.dispose();
    listViewPagingController6?.dispose();
    rowController?.dispose();
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController6(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall6 = apiCall;
    return listViewPagingController6 ??= _createListViewController6(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController6(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetEpidemicTracksPage6);
  }

  void listViewGetEpidemicTracksPage6(ApiPagingParams nextPageMarker) =>
      listViewApiCall6!(nextPageMarker)
          .then((listViewGetEpidemicTracksResponse) {
        final pageItems = (GetEpidemicTracksCall.tracks(
                  listViewGetEpidemicTracksResponse.jsonBody,
                )! ??
                [])
            .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController6?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetEpidemicTracksResponse,
                )
              : null,
        );
      });
}
