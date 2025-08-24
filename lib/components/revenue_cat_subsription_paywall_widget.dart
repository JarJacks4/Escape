import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'revenue_cat_subsription_paywall_model.dart';
export 'revenue_cat_subsription_paywall_model.dart';

class RevenueCatSubsriptionPaywallWidget extends StatefulWidget {
  const RevenueCatSubsriptionPaywallWidget({super.key});

  @override
  State<RevenueCatSubsriptionPaywallWidget> createState() =>
      _RevenueCatSubsriptionPaywallWidgetState();
}

class _RevenueCatSubsriptionPaywallWidgetState
    extends State<RevenueCatSubsriptionPaywallWidget> {
  late RevenueCatSubsriptionPaywallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RevenueCatSubsriptionPaywallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
