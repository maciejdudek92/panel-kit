import 'package:flutter/material.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/dialog.dart';

import 'package:panel_kit/menu.dart';
import 'package:panel_kit/menu_item.dart';
import 'package:panel_kit/notification.dart';
import 'package:panel_kit/page_header.dart';
import 'package:panel_kit/panel_kit.dart';
import 'package:panel_kit/page.dart';
import 'package:panel_kit/buttons.dart';

void main() {
  runApp(MainApp());
}

class Dupa extends PanelKitPage {
  Dupa({super.key})
      : super(
          title: "aaaa",
          builder: (context, controller) {
            return Container();
          },
        );
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
        panelTitle: "PanelKit - Example",
        menu: PanelKitMenu(
          menuItems: [
            PanelKitMenuItem(
              title: "Navigation Example",
              icon: Icons.home,
              page: PanelKitPage(
                title: "Navigation Example",
                builder: (context, controller) => Center(
                  child: PanelKitButton(
                    type: PanelKitButtonType.secondary,
                    onPressed: () => controller.navigateTo(
                      PanelKitPage(
                        title: "Next(1) Page Example",
                        builder: (context, controller) => Center(
                          child: PanelKitButton(
                            type: PanelKitButtonType.secondary,
                            onPressed: () => controller.navigateTo(
                              PanelKitPage(
                                title: "Next(2) Page Example",
                                builder: (context, controller) => Center(
                                  child: PanelKitButton(
                                    type: PanelKitButtonType.secondary,
                                    onPressed: () => controller.navigateTo(
                                      PanelKitPage(
                                        title: "Next(3) Page Example",
                                        builder: (context, controller) => const Center(
                                          child: Text(
                                            "Next(3) empty page.\nOn desktop use breadcumbs to navigate to previous page.\nOn mobile use back button to navigate to previous page.",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    label: "Navigate to next page (3)",
                                  ),
                                ),
                              ),
                            ),
                            label: "Navigate to next page (2)",
                          ),
                        ),
                      ),
                    ),
                    label: "Navigate to next page (1)",
                  ),
                ),
              ),
            ),
            PanelKitMenuItem(
              title: "Dupa page",
              icon: Icons.pool_sharp,
              page: Dupa(),
            ),
            PanelKitMenuItem(
              title: "Empty page",
              page: PanelKitPage(
                title: "Empty page title",
                builder: (context, controller) => const Center(
                  child: Text("Empty"),
                ),
              ),
            ),
            PanelKitMenuItem(
              title: "Elements",
              icon: Icons.tab,
              page: PanelKitPage(
                title: "Notifications, Dialogs and Buttons example",
                tabs: [
                  PanelKitPageTab(
                    title: "Buttons",
                    builder: (context, controller) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PanelKitButton(
                          type: PanelKitButtonType.primary,
                          onPressed: () {},
                          label: "Primary",
                        ),
                        const SizedBox(height: 10),
                        PanelKitButton(
                          type: PanelKitButtonType.secondary,
                          onPressed: () {},
                          label: "Secondary",
                        ),
                        const SizedBox(height: 10),
                        PanelKitButton(
                          onPressed: null,
                          label: "Disabled",
                        ),
                      ],
                    ),
                  ),
                  PanelKitPageTab(
                    title: "Notifications",
                    builder: (context, controller) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PanelKitButton(
                          type: PanelKitButtonType.secondary,
                          onPressed: () => controller.showNotification(type: PanelKitNotificationType.success, text: "Success!"),
                          label: "Show info notification",
                        ),
                        const SizedBox(height: 10),
                        PanelKitButton(
                          type: PanelKitButtonType.secondary,
                          onPressed: () => controller.showNotification(type: PanelKitNotificationType.error, text: "Error!"),
                          label: "Show error notification",
                        ),
                        const SizedBox(height: 10),
                        PanelKitButton(
                          type: PanelKitButtonType.secondary,
                          onPressed: () => controller.showNotification(type: PanelKitNotificationType.warning, text: "Warning!"),
                          label: "Show warning notification",
                        ),
                        const SizedBox(height: 10),
                        PanelKitButton(
                          type: PanelKitButtonType.secondary,
                          onPressed: () => controller.showNotification(type: PanelKitNotificationType.info, text: "Info!"),
                          label: "Show info notification",
                        ),
                      ],
                    ),
                  ),
                  PanelKitPageTab(
                    title: "Dialogs",
                    builder: (context, controller) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PanelKitButton(
                          type: PanelKitButtonType.secondary,
                          onPressed: () => controller.showDialg(PanelKitDialogType.confirmation),
                          label: "Show confirmation dialog",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PanelKitButton(
                          type: PanelKitButtonType.secondary,
                          onPressed: () => controller.showDialg(PanelKitDialogType.custom),
                          label: "Show confirmation custom dialog",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PanelKitMenuWidget.spacer(),
            PanelKitMenuWidget.divider(),
            PanelKitMenuItem(
              title: "Settings",
              icon: Icons.settings,
              page: PanelKitPage(
                title: "Settings Example",
                builder: (context, controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PanelKitButton(
                      type: PanelKitButtonType.secondary,
                      // onPressed: () => controller.setMainPage,
                      label: "Show confirmation dialog",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
