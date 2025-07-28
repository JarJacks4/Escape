import '/buttons/context_menu_item/context_menu_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:utility_functions_library_8g4bud/flutter_flow/custom_functions.dart'
    as utility_functions_library_8g4bud_functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'context_menu_example_model.dart';
export 'context_menu_example_model.dart';

class ContextMenuExampleWidget extends StatefulWidget {
  const ContextMenuExampleWidget({
    super.key,
    required this.labels,
    required this.icons,
    this.textColor,
  });

  final List<String>? labels;
  final List<Widget>? icons;
  final Color? textColor;

  @override
  State<ContextMenuExampleWidget> createState() =>
      _ContextMenuExampleWidgetState();
}

class _ContextMenuExampleWidgetState extends State<ContextMenuExampleWidget> {
  late ContextMenuExampleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContextMenuExampleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Builder(
          builder: (context) {
            final menuItems = widget!.labels!.toList();

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(menuItems.length, (menuItemsIndex) {
                final menuItemsItem = menuItems[menuItemsIndex];
                return Builder(
                  builder: (context) {
                    if (menuItemsIndex == 0) {
                      return ContextMenuItemWidget(
                        key: Key(
                            'Keyaqy_${menuItemsIndex}_of_${menuItems.length}'),
                        icon: (widget!.icons!.elementAtOrNull(menuItemsIndex))!,
                        label: menuItemsItem,
                        textColor: valueOrDefault<Color>(
                          widget!.textColor,
                          FlutterFlowTheme.of(context).secondaryText,
                        ),
                        isFirst: true,
                        isLast: false,
                        onTap: () async {},
                      );
                    } else if (menuItemsIndex ==
                        utility_functions_library_8g4bud_functions
                            .getPreviousIndex(widget!.labels!.length)) {
                      return ContextMenuItemWidget(
                        key: Key(
                            'Keykuy_${menuItemsIndex}_of_${menuItems.length}'),
                        icon: (widget!.icons!.elementAtOrNull(menuItemsIndex))!,
                        label: menuItemsItem,
                        textColor: valueOrDefault<Color>(
                          widget!.textColor,
                          FlutterFlowTheme.of(context).secondaryText,
                        ),
                        isFirst: false,
                        isLast: true,
                        onTap: () async {},
                      );
                    } else {
                      return ContextMenuItemWidget(
                        key: Key(
                            'Keyyet_${menuItemsIndex}_of_${menuItems.length}'),
                        icon: (widget!.icons!.elementAtOrNull(menuItemsIndex))!,
                        label: menuItemsItem,
                        textColor: valueOrDefault<Color>(
                          widget!.textColor,
                          FlutterFlowTheme.of(context).secondaryText,
                        ),
                        isFirst: false,
                        isLast: false,
                        onTap: () async {},
                      );
                    }
                  },
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
