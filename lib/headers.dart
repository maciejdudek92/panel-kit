import 'package:flutter/material.dart';
import 'package:panel_kit/controller.dart';
import 'package:provider/provider.dart';

class PanelKitPageHeader extends StatelessWidget {
  List<Widget> headerButtons;
  final String title;

  PanelKitPageHeader({super.key, required this.title, this.headerButtons = const []});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PanelKitController>();
    double size = controller.getScreenSize(context).width;

    return Container(
      height: 125,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: controller.theme.headerBackground,
        border: Border(
          bottom: BorderSide(color: controller.theme.borderColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: size <= 768 ? const EdgeInsets.fromLTRB(20, 0, 20, 20) : const EdgeInsets.fromLTRB(30, 35, 30, 35),
            child: Text(title, style: controller.theme.headerTextStyle),
          ),
        ],
      ),
    );
  }
}

class PageTab {
  String title;
  Widget child;
  PageTab({required this.title, required this.child});
}

class PanelKitPageHeaderWithTabs extends StatelessWidget {
  final String title;
  final List<PageTab> tabs;
  double? tabBarSize;
  PanelKitPageHeaderWithTabs({super.key, required this.title, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PanelKitController>();
    double size = controller.getScreenSize(context).width;

    double? tabBarSize = 150 * tabs.length.toDouble();
    if (tabBarSize > size) tabBarSize = null;

    return Container(
      width: double.maxFinite,
      height: 125,
      decoration: BoxDecoration(
        color: controller.theme.headerBackground,
        border: Border(
          bottom: BorderSide(color: controller.theme.borderColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: size <= 768 ? const EdgeInsets.fromLTRB(20, 0, 20, 5) : const EdgeInsets.fromLTRB(30, 35, 30, 5),
            child: Row(
              children: [
                Text(title, style: controller.theme.headerTextStyle),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: tabBarSize,
            height: 25,
            child: TabBar(
              splashFactory: NoSplash.splashFactory,
              indicatorColor: controller.theme.primaryColor,
              dividerColor: Colors.transparent,
              labelColor: controller.theme.activeMenuItemTextStyle.color,
              unselectedLabelColor: controller.theme.menuItemTextStyle.color,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: tabs.map((tab) => Text(tab.title)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
