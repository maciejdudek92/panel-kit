import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panely/controller.dart';

enum PanelyButtonType {
  primary,
  secondary;
}

// ignore: must_be_immutable
class PanelyButton extends StatelessWidget {
  PanelyButtonType type;
  String label;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final Clip? clipBehavior;
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget? child;
  final IconAlignment iconAlignment;

  PanelyButton({
    super.key,
    this.type = PanelyButtonType.primary,
    required this.label,
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
    this.child,
    this.iconAlignment = IconAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final theme = GetIt.I<PanelyController>().theme;
    bool isDisabled = onPressed == null && onLongPress == null;

    return SizedBox(
      height: 35,
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: ButtonStyle(
          backgroundColor: isDisabled ? WidgetStateProperty.all(theme.button.disabledButtonColor) : WidgetStateProperty.all(type == PanelyButtonType.primary ? theme.button.primaryBackgroundColor : theme.button.secondaryBackgroundColor),
          splashFactory: NoSplash.splashFactory,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              side: BorderSide(color: type == PanelyButtonType.secondary ? theme.borderColor : Colors.transparent),
            ),
          ),
        ),
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        iconAlignment: iconAlignment,
        child: Text(label, style: isDisabled ? GetIt.I<PanelyController>().theme.button.disabledButtonTextStyle : GetIt.I<PanelyController>().theme.button.textStyle),
      ),
    );
  }
}
