import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/page.dart';
import 'package:provider/provider.dart';

class PanelKitMenuItem extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final PanelKitPage page;
  bool isDisabled;

  PanelKitMenuItem({this.icon, required this.title, super.key, required this.page, this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PanelKitController>();
    bool isSelected = context.watch<PanelKitController>().selectedPage == page;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isSelected ? controller.theme.activedMenuItemBackground : controller.theme.menuItemBackground,
          ),
          splashFactory: NoSplash.splashFactory,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              // side: BorderSide(width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          minimumSize: WidgetStateProperty.all(const Size(double.maxFinite, 50)),
        ),
        onPressed: isDisabled
            ? null
            : () {
                context.read<PanelKitController>().setPage(page);
                Scaffold.of(context).closeDrawer();
              },
        child: Row(
          children: [
            if (icon != null)
              Icon(
                icon!,
                color: isDisabled
                    ? controller.theme.disabledMenuItemBackground
                    : isSelected
                        ? controller.theme.activeMenuItemTextStyle.color
                        : controller.theme.menuItemTextStyle.color,
                size: 24.0,
              ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                title ?? page.title,
                style: isDisabled
                    ? controller.theme.disabledMenuItemTextStyle
                    : isSelected
                        ? controller.theme.activeMenuItemTextStyle
                        : controller.theme.menuItemTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
