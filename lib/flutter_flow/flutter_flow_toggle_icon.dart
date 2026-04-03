import 'package:flutter/material.dart';

class ToggleIcon extends StatelessWidget {
  const ToggleIcon({
    super.key,
    required this.value,
    required this.onPressed,
    required this.onIcon,
    required this.offIcon,
    this.focusBorderSide,
    this.focusBorderRadius,
  });

  final bool value;
  final Function() onPressed;
  final Widget onIcon;
  final Widget offIcon;
  final BorderSide? focusBorderSide;
  final BorderRadius? focusBorderRadius;

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData.from(
          colorScheme: Theme.of(context).colorScheme,
          useMaterial3: true,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: value ? onIcon : offIcon,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
              if (states.contains(WidgetState.focused)) {
                return RoundedRectangleBorder(
                  borderRadius: focusBorderRadius ?? BorderRadius.circular(8),
                  side: focusBorderSide ?? BorderSide.none,
                );
              }
              return const RoundedRectangleBorder(
                side: BorderSide.none,
              );
            }),
          ),
        ),
      );
}
