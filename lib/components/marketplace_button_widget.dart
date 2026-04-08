import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'marketplace_button_model.dart';
export 'marketplace_button_model.dart';

class MarketplaceButtonWidget extends StatefulWidget {
  const MarketplaceButtonWidget({super.key});

  @override
  State<MarketplaceButtonWidget> createState() =>
      _MarketplaceButtonWidgetState();
}

class _MarketplaceButtonWidgetState extends State<MarketplaceButtonWidget> {
  late MarketplaceButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketplaceButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54.01,
      height: 49.0,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: Icon(
              FFIcons.kmarket1,
              color: Color(0xFFF6AB27),
              size: 24.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          SizedBox(
            height: 30.0,
            child: VerticalDivider(
              thickness: 1.0,
              color: Color(0x9039519F),
            ),
          ),
        ],
      ),
    );
  }
}
