import '/components/page_view_blogs_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'blogs_widget.dart' show BlogsWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
