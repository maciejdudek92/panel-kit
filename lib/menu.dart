import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/menu_item.dart';

class PanelKitMenu extends StatelessWidget {
  final List<PanelKitMenuItem> menuItems;
  final double width;
  PanelKitMenu({
    super.key,
    required this.menuItems,
    this.width = 200,
  });

  final controller = GetIt.I<PanelKitController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color: controller.theme.borderColor),
        ),
        color: controller.theme.menu.backgroundColor,
      ),
      child: Drawer(
        backgroundColor: Colors.transparent,
        shape: const ContinuousRectangleBorder(side: BorderSide(width: 1)),
        width: width, //width,
        // elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ...menuItems,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
