import 'package:example/pages/elements_page/buttons_page.dart';
import 'package:example/pages/elements_page/dialogs_page.dart';
import 'package:example/pages/elements_page/notifications.dart';
import 'package:example/pages/empty_page.dart';
import 'package:example/pages/navigation_page.dart';
import 'package:example/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:panely/components/content_page/content_page.dart';
import 'package:panely/components/content_page/content_page_header.dart';
import 'package:panely/components/sidebar/sidebar_widget.dart';
import 'package:panely/controller.dart';
import 'package:panely/components/sidebar/sidebar.dart';
import 'package:panely/components/sidebar/sidebar_configuration.dart';
import 'package:panely/panel_kit.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final PanelyController controller = PanelyController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      home: Panely(
        controller: controller,
        panelTitle: "Panely - Dashboard",
        sidebar: PanelySidebar(
          configuration: const PanelySidebarConfiguration(
            viewMode: PanelySidebarViewMode.desktop,
          ),
          menuItems: [
            PanelySidebarButton(
              title: "Navigation Example",
              icon: Icons.home,
              page: PanelyContentPage(
                title: "Navigation Example",
                builder: (context, controller, setState) => const NavigationPage(),
              ),
            ),
            PanelySidebarButton(
              title: "Empty page",
              page: PanelyContentPage(
                title: "Navigation Example",
                builder: (context, controller, setState) => const EmptyPage(),
              ),
            ),
            PanelySidebarButton(
              title: "UI Components",
              icon: Icons.tab,
              page: PanelyContentPage.withTabs(
                title: "UI Components Example",
                tabs: [
                  PanelyContentPageTab(
                    title: "Buttons",
                    builder: (context, controller) => const ButtonsPage(),
                  ),
                  PanelyContentPageTab(
                    title: "Notifications",
                    builder: (context, controller) => const NotificationsPage(),
                  ),
                  PanelyContentPageTab(
                    title: "Dialogs",
                    builder: (context, controller) => const DialogsPage(),
                  ),
                ],
              ),
            ),
            PanelySidebarSpacer(),
            PanelySidebarDivider(),
            PanelySidebarButton(
              title: "Settings",
              icon: Icons.settings,
              page: PanelyContentPage(
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
