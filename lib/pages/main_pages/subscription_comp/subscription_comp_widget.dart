import '/components/subscription_comp2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subscription_comp_model.dart';
export 'subscription_comp_model.dart';

class SubscriptionCompWidget extends StatefulWidget {
  const SubscriptionCompWidget({super.key});

  @override
  State<SubscriptionCompWidget> createState() => _SubscriptionCompWidgetState();
}

class _SubscriptionCompWidgetState extends State<SubscriptionCompWidget> {
  late SubscriptionCompModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionCompModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SubscriptionComp'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: wrapWithModel(
          model: _model.subscriptionComp2Model,
          updateCallback: () => safeSetState(() {}),
          child: SubscriptionComp2Widget(),
        ),
      ),
    );
  }
}
