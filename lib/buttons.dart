import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panel_kit/controller.dart';

enum PanelKitButtonType {
  primary,
  secondary;
}

// ignore: must_be_immutable
class PanelKitButton extends StatelessWidget {
  PanelKitButtonType type;
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

  PanelKitButton({
    super.key,
    this.type = PanelKitButtonType.primary,
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
    final theme = GetIt.I<PanelKitController>().theme;
    bool isDisabled = onPressed == null && onLongPress == null;

    return SizedBox(
      height: 35,
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: ButtonStyle(
          backgroundColor: isDisabled
              ? WidgetStateProperty.all(theme.button.disabledButtonColor)
              : WidgetStateProperty.all(type == PanelKitButtonType.primary
                  ? theme.button.primaryBackgroundColor
                  : theme.button.secondaryBackgroundColor),
          splashFactory: NoSplash.splashFactory,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              side: BorderSide(
                  color: type == PanelKitButtonType.secondary
                      ? theme.borderColor
                      : Colors.transparent),
            ),
          ),
        ),
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        iconAlignment: iconAlignment,
        child: Text(label,
            style: isDisabled
                ? GetIt.I<PanelKitController>()
                    .theme
                    .button
                    .disabledButtonTextStyle
                : GetIt.I<PanelKitController>().theme.button.textStyle),
      ),
    );
  }
}
