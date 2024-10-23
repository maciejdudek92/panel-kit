import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/menu_item.dart';
import 'package:provider/provider.dart';

class PanelKitMenu extends StatefulWidget {
  final List<PanelKitMenuItem> menuItems;

  const PanelKitMenu({super.key, required this.menuItems});

  @override
  State<PanelKitMenu> createState() => _PanelKitMenuState();
}

class _PanelKitMenuState extends State<PanelKitMenu> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<PanelKitController>();

    return Container(
      decoration: BoxDecoration(border: Border(right: BorderSide(width: 1, color: controller.theme.borderColor)), color: controller.theme.menuBackground),
      child: Drawer(
        backgroundColor: Colors.transparent,
        shape: ContinuousRectangleBorder(side: BorderSide(width: 1)),
        width: 250, //width,
        // elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ...widget.menuItems,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
