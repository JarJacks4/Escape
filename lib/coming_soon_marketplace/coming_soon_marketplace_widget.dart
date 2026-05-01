import '/components/marketplace_coming_soon_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'coming_soon_marketplace_model.dart';
export 'coming_soon_marketplace_model.dart';

class ComingSoonMarketplaceWidget extends StatefulWidget {
  const ComingSoonMarketplaceWidget({super.key});

  static String routeName = 'ComingSoonMarketplace';
  static String routePath = 'comingSoonMarketplace';

  @override
  State<ComingSoonMarketplaceWidget> createState() =>
      _ComingSoonMarketplaceWidgetState();
}

class _ComingSoonMarketplaceWidgetState
    extends State<ComingSoonMarketplaceWidget> {
  late ComingSoonMarketplaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComingSoonMarketplaceModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ComingSoonMarketplace'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.marketplaceComingSoonCompModel,
              updateCallback: () => safeSetState(() {}),
              child: MarketplaceComingSoonCompWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
