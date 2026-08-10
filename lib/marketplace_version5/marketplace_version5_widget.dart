import '/components/marketplace_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'marketplace_version5_model.dart';
export 'marketplace_version5_model.dart';

class MarketplaceVersion5Widget extends StatefulWidget {
  const MarketplaceVersion5Widget({super.key});

  static String routeName = 'MarketplaceVersion5';
  static String routePath = '/marketplaceVersion5';

  @override
  State<MarketplaceVersion5Widget> createState() =>
      _MarketplaceVersion5WidgetState();
}

class _MarketplaceVersion5WidgetState extends State<MarketplaceVersion5Widget> {
  late MarketplaceVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketplaceVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MarketplaceVersion5'});
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
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: 920.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Escape_Soundscapes_(2).png',
                    ).image,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: wrapWithModel(
                        model: _model.marketplaceModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MarketplaceWidget(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
