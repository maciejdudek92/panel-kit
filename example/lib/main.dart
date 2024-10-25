import 'package:example/pages/elements_page.dart';
import 'package:example/pages/empty_page.dart';
import 'package:example/pages/navigation_page.dart';
import 'package:example/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/menu.dart';
import 'package:panel_kit/menu_item.dart';
import 'package:panel_kit/panel_kit.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final PanelKitController controller = PanelKitController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      home: PanelKit(
        controller: controller,
        panelTitle: "PanelKit - Example",
        menu: PanelKitMenu(
          menuItems: [
            PanelKitMenuItem(
              title: "Navigation Example",
              icon: Icons.home,
              page: NavigationPage(),
            ),
            PanelKitMenuItem(
              title: "Empty page",
              page: EmptyPage(),
            ),
            PanelKitMenuItem(
              title: "UI Elements",
              icon: Icons.tab,
              page: ElementsPage(),
            ),
            PanelKitMenuWidget.spacer(),
            PanelKitMenuWidget.divider(),
            PanelKitMenuItem(
              title: "Settings",
              icon: Icons.settings,
              page: SettingsPage(),
            ),
          ],
        ),
      ),
    );
  }
}
