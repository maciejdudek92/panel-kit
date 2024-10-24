// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panel_kit/controller.dart';

class PanelKitPageHeader extends StatelessWidget {
  List<Widget> headerButtons;
  final String title;
  final controller = GetIt.I<PanelKitController>();
  PanelKitPageHeader({super.key, required this.title, this.headerButtons = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 150),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: controller.theme.page.headerBackgroundColor,
        border: Border(
          bottom: BorderSide(color: controller.theme.borderColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 45, 30, 0),
            child: Text(title, style: controller.theme.page.headerTextStyle),
          ),
        ],
      ),
    );
  }
}

class PanelKitPageTab {
  String title;
  final Widget Function(BuildContext context, PanelKitController controller) builder;
  PanelKitPageTab({required this.title, required this.builder});
}

class PanelKitPageHeaderWithTabs extends StatelessWidget {
  final String title;
  final List<PanelKitPageTab> tabs;
  double? tabBarSize;
  PanelKitPageHeaderWithTabs({super.key, required this.title, required this.tabs});
  final controller = GetIt.I<PanelKitController>();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    double? tabBarSize = 150 * tabs.length.toDouble();
    if (tabBarSize > size) tabBarSize = null;

    return Container(
      // width: double.maxFinite,
      // height: 150,
      constraints: const BoxConstraints(minHeight: 150),
      decoration: BoxDecoration(
        color: controller.theme.page.headerBackgroundColor,
        border: Border(
          bottom: BorderSide(color: controller.theme.borderColor),
        ),
      ),
      child: SizedBox(
        height: 150,
        // flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 45, 30, 0),
              child: Row(
                children: [
                  Text(title, style: controller.theme.page.headerTextStyle),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: tabBarSize,
              height: 25,
              child: TabBar(
                splashFactory: NoSplash.splashFactory,
                indicatorColor: controller.theme.primaryAccentColor,
                dividerColor: Colors.transparent,
                labelColor: controller.theme.menu.activeMenuItemTextStyle.color,
                unselectedLabelColor: controller.theme.menu.menuItemTextStyle.color,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: tabs.map((tab) => Text(tab.title)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
