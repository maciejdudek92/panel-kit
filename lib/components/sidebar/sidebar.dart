import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panely/components/sidebar/sidebar_widget.dart';
import 'package:panely/controller.dart';
import 'package:panely/components/sidebar/sidebar_configuration.dart';

class PanelySidebar extends StatelessWidget {
  final PanelySidebarConfiguration configuration;
  final List<PanelySidebarWidget> menuItems;
  final double width;
  PanelySidebar({
    super.key,
    required this.menuItems,
    this.configuration = const PanelySidebarConfiguration(),
    this.width = 200,
  });

  final controller = GetIt.I<PanelyController>();

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
