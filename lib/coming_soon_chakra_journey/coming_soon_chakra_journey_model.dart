import '/components/marketplace_coming_soon_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'coming_soon_chakra_journey_widget.dart'
    show ComingSoonChakraJourneyWidget;
import 'package:flutter/material.dart';

class ComingSoonChakraJourneyModel
    extends FlutterFlowModel<ComingSoonChakraJourneyWidget> {
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
