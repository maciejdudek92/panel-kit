// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/page.dart';
import 'package:provider/provider.dart';

abstract class PanelKitMenuWidget extends StatelessWidget {
  const PanelKitMenuWidget({super.key});
  static _PanelKitMenuSpacer spacer() => const _PanelKitMenuSpacer();
  static _PanelKitMenuDivider divider() => const _PanelKitMenuDivider();
}

class _PanelKitMenuSpacer extends PanelKitMenuWidget {
  const _PanelKitMenuSpacer();
  @override
  Widget build(BuildContext context) {
    return const Spacer();
  }
}

class _PanelKitMenuDivider extends PanelKitMenuWidget {
  const _PanelKitMenuDivider();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Divider(
        height: 1,
      ),
    );
  }
}

class PanelKitMenuItem extends PanelKitMenuWidget {
  final String title;
  final IconData? icon;
  final PanelKitPage page;
  final bool isDisabled;
  final EdgeInsets padding;

  const PanelKitMenuItem({
    this.icon,
    required this.title,
    super.key,
    required this.page,
    this.isDisabled = false,
    this.padding = const EdgeInsets.symmetric(vertical: 2.5),
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PanelKitController>();

    bool isSelected = controller.mainPage == page;

    return Padding(
      padding: padding,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isSelected ? controller.theme.menu.activedMenuItemBackgroundColor : controller.theme.menu.menuItemBackgroundColor,
          ),
          splashFactory: NoSplash.splashFactory,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              // side: BorderSide(width: 1),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          minimumSize: WidgetStateProperty.all(const Size(double.maxFinite, 50)),
        ),
        onPressed: isDisabled
            ? null
            : () {
                controller.setMainPage(page);
                Scaffold.of(context).closeDrawer();
              },
        child: SizedBox(
          width: double.maxFinite,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Icon(
                  icon!,
                  color: isDisabled
                      ? controller.theme.menu.disabledMenuItemBackgroundColor
                      : isSelected
                          ? controller.theme.menu.activeMenuItemTextStyle.color
                          : controller.theme.menu.menuItemTextStyle.color,
                  size: 18.0,
                ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  title,
                  style: isDisabled
                      ? controller.theme.menu.disabledMenuItemTextStyle
                      : isSelected
                          ? controller.theme.menu.activeMenuItemTextStyle
                          : controller.theme.menu.menuItemTextStyle,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
