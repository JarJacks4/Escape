import '/components/lucille_promo_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'self_care_a_i_promo_widget.dart' show SelfCareAIPromoWidget;
import 'package:flutter/material.dart';

class SelfCareAIPromoModel extends FlutterFlowModel<SelfCareAIPromoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LucillePromoBottomSheet component.
  late LucillePromoBottomSheetModel lucillePromoBottomSheetModel;

  @override
  void initState(BuildContext context) {
    lucillePromoBottomSheetModel =
        createModel(context, () => LucillePromoBottomSheetModel());
  }

  @override
  void dispose() {
    lucillePromoBottomSheetModel.dispose();
  }
}
