import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/headers/header_blogs/header_blogs_widget.dart';
import 'blogs_home_widget.dart' show BlogsHomeWidget;
import 'package:flutter/material.dart';

class BlogsHomeModel extends FlutterFlowModel<BlogsHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeaderBlogs component.
  late HeaderBlogsModel headerBlogsModel;
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    headerBlogsModel = createModel(context, () => HeaderBlogsModel());
  }

  @override
  void dispose() {
    headerBlogsModel.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }
}
