// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_slidable/flutter_slidable.dart';

class ThatSlideableWidget extends StatefulWidget {
  const ThatSlideableWidget(
      {required this.height,
      required this.width,
      required this.child,
      this.startPaneExtentRatio,
      this.startPaneCloseThreshold,
      this.startPaneMotion,
      this.startPaneOpenThreshold,
      this.startPaneDragDismissible,
      this.onStartActionPaneDismissed,
      this.endPaneExtentRatio,
      this.endPaneCloseThreshold,
      this.endPaneMotion,
      this.endPaneOpenThreshold,
      this.endPaneDragDismissible,
      this.onEndActionPaneDismissed,
      required this.startPaneFirstActionIcon,
      required this.startPaneFirstActionStruct,
      this.onStartPaneFirstActionPressed,
      this.startPaneSecondActionIcon,
      this.startPaneSecondActionStruct,
      this.onStartPaneSecondActionPressed,
      this.startPaneThirdActionIcon,
      this.startPaneThirdActionStruct,
      this.onStartPaneThirdActionPressed,
      this.startPaneFourthActionIcon,
      this.startPaneFourthActionStruct,
      this.onStartPaneFourthActionPressed,
      this.startPaneFifthActionStruct,
      this.startPaneFifthActionIcon,
      this.onStartPaneFifthActionPressed,
      this.endPaneFirstActionIcon,
      this.endPaneFirstActionStruct,
      this.onEndPaneFirstActionPressed,
      this.endPaneSecondActionIcon,
      this.endPaneSecondActionStruct,
      this.onEndPaneSecondActionPressed,
      this.endPaneThirdActionIcon,
      this.endPaneThirdActionStruct,
      this.onEndPaneThirdActionPressed,
      this.endPaneFourthActionIcon,
      this.endPaneFourthActionStruct,
      this.onEndPaneFourthActionPressed,
      this.endPaneFifthActionIcon,
      this.endPaneFifthActionStruct,
      this.onEndPaneFifthActionPressed});

  final double width;
  final double height;
  final Widget Function() child;

  // Start Action Pane details //
  final double? startPaneExtentRatio;
  final ActionPaneMotion? startPaneMotion;
  final bool? startPaneDragDismissible;
  final double? startPaneOpenThreshold;
  final double? startPaneCloseThreshold;
  final Future Function()? onStartActionPaneDismissed;

  // End Action Pane details //
  final double? endPaneExtentRatio;
  final ActionPaneMotion? endPaneMotion;
  final bool? endPaneDragDismissible;
  final double? endPaneOpenThreshold;
  final double? endPaneCloseThreshold;
  final Future Function()? onEndActionPaneDismissed;

  // start pane //
  // 1st action
  final Widget startPaneFirstActionIcon;
  final SlideActionDataTypeStruct startPaneFirstActionStruct;
  final Future Function()? onStartPaneFirstActionPressed;

  // 2nd action
  final Widget? startPaneSecondActionIcon;
  final SlideActionDataTypeStruct? startPaneSecondActionStruct;
  final Future Function()? onStartPaneSecondActionPressed;

  // 3rd action
  final Widget? startPaneThirdActionIcon;
  final SlideActionDataTypeStruct? startPaneThirdActionStruct;
  final Future Function()? onStartPaneThirdActionPressed;

  // 4th action
  final Widget? startPaneFourthActionIcon;
  final SlideActionDataTypeStruct? startPaneFourthActionStruct;
  final Future Function()? onStartPaneFourthActionPressed;

  // 5th action
  final Widget? startPaneFifthActionIcon;
  final SlideActionDataTypeStruct? startPaneFifthActionStruct;
  final Future Function()? onStartPaneFifthActionPressed;

  // end pane //
  // 1st action
  final Widget? endPaneFirstActionIcon;
  final SlideActionDataTypeStruct? endPaneFirstActionStruct;
  final Future Function()? onEndPaneFirstActionPressed;

  // 2nd action
  final Widget? endPaneSecondActionIcon;
  final SlideActionDataTypeStruct? endPaneSecondActionStruct;
  final Future Function()? onEndPaneSecondActionPressed;

  // 3rd action
  final Widget? endPaneThirdActionIcon;
  final SlideActionDataTypeStruct? endPaneThirdActionStruct;
  final Future Function()? onEndPaneThirdActionPressed;

  // 4th action
  final Widget? endPaneFourthActionIcon;
  final SlideActionDataTypeStruct? endPaneFourthActionStruct;
  final Future Function()? onEndPaneFourthActionPressed;

  // 5th action
  final Widget? endPaneFifthActionIcon;
  final SlideActionDataTypeStruct? endPaneFifthActionStruct;
  final Future Function()? onEndPaneFifthActionPressed;

  @override
  State<ThatSlideableWidget> createState() => _ThatSlideableWidgetState();
}

class _ThatSlideableWidgetState extends State<ThatSlideableWidget>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);

  List<Widget> _buildActions(
      List<(Widget?, SlideActionDataTypeStruct?, Future Function()?)> actions) {
    return actions
        .where((action) => action.$1 != null && action.$2 != null)
        .map((action) {
      return SlidableAction(
        onPressed: (context) => action.$3?.call(),
        backgroundColor: action.$2!.backgroundColor ?? Colors.grey,
        foregroundColor: action.$2!.foregroundColor ?? Colors.white,
        icon: (action.$1 as Icon).icon,
        label: action.$2!.label ?? '',
        flex: action.$2?.flex ?? 1,
        spacing: action.$2?.spacing ?? 4.0,
        autoClose: action.$2?.autoClose ?? false,
        borderRadius:
            BorderRadius.all(Radius.circular(action.$2?.borderRadius ?? 4.0)),
      );
    }).toList();
  }

  Widget _getScrollMotionForStartPane() {
    switch (widget.startPaneMotion?.name) {
      case "behind":
        return const BehindMotion();
      case "drawer":
        return const DrawerMotion();
      case "scroll":
        return const ScrollMotion();
      case "stretch":
        return const StretchMotion();
      default:
        return const ScrollMotion();
    }
  }

  Widget _getScrollMotionForEndPane() {
    switch (widget.endPaneMotion?.name) {
      case "behind":
        return const BehindMotion();
      case "drawer":
        return const DrawerMotion();
      case "scroll":
        return const ScrollMotion();
      case "stretch":
        return const StretchMotion();
      default:
        return const ScrollMotion();
    }
  }

  ActionPane _startActionPane() {
    return ActionPane(
      motion: _getScrollMotionForStartPane(),
      dragDismissible: widget.startPaneDragDismissible ?? true,
      dismissible: DismissiblePane(onDismissed: () {
        widget.onStartActionPaneDismissed?.call();
      }),
      children: _buildActions(
        [
          (
            widget.startPaneFirstActionIcon,
            widget.startPaneFirstActionStruct,
            widget.onStartPaneFirstActionPressed
          ),
          (
            widget.startPaneSecondActionIcon,
            widget.startPaneSecondActionStruct,
            widget.onStartPaneSecondActionPressed
          ),
          (
            widget.startPaneThirdActionIcon,
            widget.startPaneThirdActionStruct,
            widget.onStartPaneThirdActionPressed
          ),
          (
            widget.startPaneFourthActionIcon,
            widget.startPaneFourthActionStruct,
            widget.onStartPaneFourthActionPressed
          ),
          (
            widget.startPaneFifthActionIcon,
            widget.startPaneFifthActionStruct,
            widget.onStartPaneFifthActionPressed
          ),
        ],
      ),
    );
  }

  ActionPane _endActionPane() {
    return ActionPane(
      motion: _getScrollMotionForEndPane(),
      dragDismissible: widget.endPaneDragDismissible ?? true,
      dismissible: DismissiblePane(onDismissed: () {
        widget.onEndActionPaneDismissed?.call();
      }),
      children: _buildActions(
        [
          (
            widget.endPaneFirstActionIcon,
            widget.endPaneFirstActionStruct,
            widget.onEndPaneFirstActionPressed
          ),
          (
            widget.endPaneSecondActionIcon,
            widget.endPaneSecondActionStruct,
            widget.onEndPaneSecondActionPressed
          ),
          (
            widget.endPaneThirdActionIcon,
            widget.endPaneThirdActionStruct,
            widget.onEndPaneThirdActionPressed
          ),
          (
            widget.endPaneFourthActionIcon,
            widget.endPaneFourthActionStruct,
            widget.onEndPaneFourthActionPressed
          ),
          (
            widget.endPaneFifthActionIcon,
            widget.endPaneFifthActionStruct,
            widget.onEndPaneFifthActionPressed
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      controller: controller,
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(1),

      // The start action pane is the one at the left or the top side.
      startActionPane: _startActionPane(),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: _endActionPane(),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: widget.child(),
    );
  }
}

void doNothing(BuildContext context) {}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
