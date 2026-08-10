import '/components/marketplace_coming_soon_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'coming_soon_chakra_journey_model.dart';
export 'coming_soon_chakra_journey_model.dart';

class ComingSoonChakraJourneyWidget extends StatefulWidget {
  const ComingSoonChakraJourneyWidget({super.key});

  static String routeName = 'ComingSoonChakraJourney';
  static String routePath = '/comingSoonChakraJourney';

  @override
  State<ComingSoonChakraJourneyWidget> createState() =>
      _ComingSoonChakraJourneyWidgetState();
}

class _ComingSoonChakraJourneyWidgetState
    extends State<ComingSoonChakraJourneyWidget> {
  late ComingSoonChakraJourneyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComingSoonChakraJourneyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ComingSoonChakraJourney'});
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
