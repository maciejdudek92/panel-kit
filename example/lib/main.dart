import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/dialog.dart';

import 'package:panel_kit/menu.dart';
import 'package:panel_kit/menu_item.dart';
import 'package:panel_kit/notification.dart';
import 'package:panel_kit/page_headers.dart';
import 'package:panel_kit/panel_kit.dart';
import 'package:panel_kit/page.dart';
import 'package:panel_kit/buttons.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final PanelKitController controller = PanelKitController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: PanelKit(
        controller: controller,
        title: "PanelKit - Example",
        menu: PanelKitMenu(
          menuItems: [
            PanelKitMenuItem(
              title: "Notifications",
              icon: Icons.home,
              page: PanelKitPage(
                title: "Notifications Test",
                builder: (context) => Center(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          PanelKitButton(type: PanelKitButtonType.secondary, onPressed: () => controller.showNotification(type: PanelKitNotificationType.success, text: "Success!"), label: "Show info notification"),
                          const SizedBox(height: 10),
                          PanelKitButton(type: PanelKitButtonType.secondary, onPressed: () => controller.showNotification(type: PanelKitNotificationType.error, text: "Error!"), label: "Show error notification"),
                          const SizedBox(height: 10),
                          PanelKitButton(onPressed: () => controller.showNotification(type: PanelKitNotificationType.warning, text: "Warning!"), label: "Show warning notification"),
                          const SizedBox(height: 10),
                          PanelKitButton(onPressed: () => controller.showNotification(type: PanelKitNotificationType.info, text: "Info!"), label: "Show info notification"),
                        ],
                      ),
                      Column(
                        children: [
                          PanelKitButton(type: PanelKitButtonType.secondary, onPressed: () => controller.showDialg(PanelKitDialogType.confirmation), label: "Show confirmation dialog"),
                          const SizedBox(height: 10),
                          PanelKitButton(onPressed: () => controller.showDialg(PanelKitDialogType.custom), label: "Show confirmation custom dialog"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PanelKitMenuItem(
              title: "Button Title without icon",
              page: PanelKitPage(
                title: "Second PanelKitPage Title",
                builder: (context) => Container(),
              ),
            ),
            PanelKitMenuItem(
              title: "Button Title 3",
              icon: Icons.tab,
              page: PanelKitPage(
                title: "PanelKitPage with Tabs",
                tabs: [
                  PageTab(title: "Option 1", child: Container()),
                  PageTab(title: "Option 2", child: Container()),
                ],
              ),
            ),
            PanelKitMenuWidget.spacer(),
            PanelKitMenuItem(
              title: "Settings Button",
              icon: Icons.settings,
              page: PanelKitPage(
                title: "Settings Example",
                builder: (context) => Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
