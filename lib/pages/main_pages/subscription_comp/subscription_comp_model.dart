import '/components/subscription_comp2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'subscription_comp_widget.dart' show SubscriptionCompWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscriptionCompModel extends FlutterFlowModel<SubscriptionCompWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SubscriptionComp2 component.
  late SubscriptionComp2Model subscriptionComp2Model;

  @override
  void initState(BuildContext context) {
    subscriptionComp2Model =
        createModel(context, () => SubscriptionComp2Model());
  }

  @override
  void dispose() {
    subscriptionComp2Model.dispose();
  }
}
