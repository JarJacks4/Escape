import '/components/marketplace_coming_soon_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'coming_soon_marketplace_widget.dart' show ComingSoonMarketplaceWidget;
import 'package:flutter/material.dart';

class ComingSoonMarketplaceModel
    extends FlutterFlowModel<ComingSoonMarketplaceWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MarketplaceComingSoonComp component.
  late MarketplaceComingSoonCompModel marketplaceComingSoonCompModel;

  @override
  void initState(BuildContext context) {
    marketplaceComingSoonCompModel =
        createModel(context, () => MarketplaceComingSoonCompModel());
  }

  @override
  void dispose() {
    marketplaceComingSoonCompModel.dispose();
  }
}
