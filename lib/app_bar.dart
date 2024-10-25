import 'package:flutter/material.dart';
import 'package:panel_kit/controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

enum AppBarPageTitle {
  fromButton,
  fromPage;
}

class PanelKitAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarPageTitle titleDisplaySettings;
  const PanelKitAppBar(
      {super.key, this.titleDisplaySettings = AppBarPageTitle.fromButton});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PanelKitController>();
    double size = MediaQuery.of(context).size.width;

    IconButton drawerButton = IconButton(
      icon: const Icon(Icons.menu),
      color: controller.theme.primaryAccentColor,
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );

    IconButton backButton = IconButton(
      icon: const Icon(Icons.chevron_left_rounded),
      color: controller.theme.primaryAccentColor,
      onPressed: () => controller.navigateBack(),
    );

    List<Widget> appBarContent = [
      const SizedBox(width: 15),
      Text(
        controller.panelTitle,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
      ),
    ];

    switch (size) {
      case <= 1024:
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: controller.theme.borderColor),
            ),
          ),
          child: AppBar(
            leadingWidth: double.maxFinite,
            backgroundColor: Colors.transparent,
            leading: SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 15),
                  controller.isFirstPageActive ? drawerButton : backButton,
                  ...appBarContent,
                ],
              ),
            ),
          ),
        );
      default:
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: controller.theme.borderColor),
            ),
          ),
          child: AppBar(
            leadingWidth: double.maxFinite,
            backgroundColor: Colors.transparent,
            leading: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 15),
                ...appBarContent,
                const SizedBox(width: 30),
                BreadCrumb(
                  items: controller.breadCumbsData.map((element) {
                    return BreadCrumbItem(
                      content: Text(
                        element["title"],
                        style: element["style"],
                      ),
                      onTap: element["action"],
                    );
                  }).toList(),
                  divider: const Text("  /  "),
                )
              ],
            ),
          ),
        );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
