import '/components/accordion_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'accordion_widget.dart' show AccordionWidget;
import 'package:flutter/material.dart';

class AccordionModel extends FlutterFlowModel<AccordionWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for AccordionItem.
  late AccordionItemModel accordionItemModel1;
  // Model for AccordionItem.
  late AccordionItemModel accordionItemModel2;
  // Model for AccordionItem.
  late AccordionItemModel accordionItemModel3;

  @override
  void initState(BuildContext context) {
    accordionItemModel1 = createModel(context, () => AccordionItemModel());
    accordionItemModel2 = createModel(context, () => AccordionItemModel());
    accordionItemModel3 = createModel(context, () => AccordionItemModel());
  }

  @override
  void dispose() {
    accordionItemModel1.dispose();
    accordionItemModel2.dispose();
    accordionItemModel3.dispose();
  }
}
