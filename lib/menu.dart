import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/menu_item.dart';

class PanelKitMenu extends StatefulWidget {
  final List<PanelKitMenuWidget> menuItems;

  const PanelKitMenu({super.key, required this.menuItems});

  @override
  State<PanelKitMenu> createState() => _PanelKitMenuState();
}

class _PanelKitMenuState extends State<PanelKitMenu> {
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
        width: 200, //width,
        // elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ...widget.menuItems,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
