import '/components/checkout_escape_premium_annual_widget.dart';
import '/components/checkout_escape_premium_monthly_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'subscription_profile_page_widget.dart'
    show SubscriptionProfilePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SubscriptionProfilePageModel
    extends FlutterFlowModel<SubscriptionProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [RevenueCat - Purchase] action in Container widget.
  bool? didPurchase;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // Stores action output result for [RevenueCat - Purchase] action in Container widget.
  bool? didPurchaseCopy;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
