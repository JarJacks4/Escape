import '/components/marketplace_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'marketplace_version5_widget.dart' show MarketplaceVersion5Widget;
import 'package:flutter/material.dart';

class MarketplaceVersion5Model
    extends FlutterFlowModel<MarketplaceVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for Marketplace component.
  late MarketplaceModel marketplaceModel;

  @override
  void initState(BuildContext context) {
    marketplaceModel = createModel(context, () => MarketplaceModel());
  }

  @override
  void dispose() {
    marketplaceModel.dispose();
  }
}
