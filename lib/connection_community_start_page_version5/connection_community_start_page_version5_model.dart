import '/components/community_starter_page_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'connection_community_start_page_version5_widget.dart'
    show ConnectionCommunityStartPageVersion5Widget;
import 'package:flutter/material.dart';

class ConnectionCommunityStartPageVersion5Model
    extends FlutterFlowModel<ConnectionCommunityStartPageVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for CommunityStarterPageVersion5 component.
  late CommunityStarterPageVersion5Model communityStarterPageVersion5Model;

  @override
  void initState(BuildContext context) {
    communityStarterPageVersion5Model =
        createModel(context, () => CommunityStarterPageVersion5Model());
  }

  @override
  void dispose() {
    communityStarterPageVersion5Model.dispose();
  }
}
