import 'package:example/pages/elements_page/buttons_page.dart';
import 'package:example/pages/elements_page/dialogs_page.dart';
import 'package:example/pages/elements_page/notifications.dart';
import 'package:example/pages/empty_page.dart';
import 'package:example/pages/navigation_page.dart';
import 'package:example/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/menu.dart';
import 'package:panel_kit/menu_item.dart';
import 'package:panel_kit/page.dart';
import 'package:panel_kit/page_header.dart';
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
            PanelKitMenuButton(
              title: "Navigation Example",
              icon: Icons.home,
              page: PanelKitPage(
                title: "Navigation Example",
                builder: (context, controller, setState) => const NavigationPage(),
              ),
            ),
            PanelKitMenuButton(
              title: "Empty page",
              page: PanelKitPage(
                title: "Navigation Example",
                builder: (context, controller, setState) => const EmptyPage(),
              ),
            ),
            PanelKitMenuButton(
              title: "UI Elements",
              icon: Icons.tab,
              page: PanelKitPage.withTabs(
                title: "UI Elements Example",
                tabs: [
                  PanelKitPageTab(
                    title: "Buttons",
                    builder: (context, controller) => const ButtonsPage(),
                  ),
                  PanelKitPageTab(
                    title: "Notifications",
                    builder: (context, controller) => const NotificationsPage(),
                  ),
                  PanelKitPageTab(
                    title: "Dialogs",
                    builder: (context, controller) => const DialogsPage(),
                  ),
                ],
              ),
            ),
            PanelKitMenuSpacer(),
            PanelKitMenuDivider(),
            PanelKitMenuButton(
              title: "Settings",
              icon: Icons.settings,
              page: PanelKitPage(
                title: "SettingPage",
                builder: (context, controller, setState) => const SettingsPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
