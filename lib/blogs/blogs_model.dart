import '/components/page_view_blogs_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'blogs_widget.dart' show BlogsWidget;
import 'package:flutter/material.dart';

class BlogsModel extends FlutterFlowModel<BlogsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PageViewBlogs component.
  late PageViewBlogsModel pageViewBlogsModel;

  @override
  void initState(BuildContext context) {
    pageViewBlogsModel = createModel(context, () => PageViewBlogsModel());
  }

  @override
  void dispose() {
    pageViewBlogsModel.dispose();
  }
}
