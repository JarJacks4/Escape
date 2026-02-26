import '/components/contact_us_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contact_us_version5_widget.dart' show ContactUsVersion5Widget;
import 'package:flutter/material.dart';

class ContactUsVersion5Model extends FlutterFlowModel<ContactUsVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for ContactUsComp component.
  late ContactUsCompModel contactUsCompModel;

  @override
  void initState(BuildContext context) {
    contactUsCompModel = createModel(context, () => ContactUsCompModel());
  }

  @override
  void dispose() {
    contactUsCompModel.dispose();
  }
}
