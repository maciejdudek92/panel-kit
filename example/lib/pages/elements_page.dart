import 'package:flutter/material.dart';
import 'package:panel_kit/buttons.dart';
import 'package:panel_kit/dialog.dart';
import 'package:panel_kit/notification.dart';
import 'package:panel_kit/page.dart';
import 'package:panel_kit/page_header.dart';

class ElementsPage extends PanelKitPage {
  ElementsPage({super.key})
      : super(
          title: "UI Elements Example",
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
                    onPressed: () => controller.showNotification(
                        type: PanelKitNotificationType.success,
                        title: "Success!"),
                    label: "Show info notification",
                  ),
                  const SizedBox(height: 10),
                  PanelKitButton(
                    type: PanelKitButtonType.secondary,
                    onPressed: () => controller.showNotification(
                        type: PanelKitNotificationType.error, title: "Error!"),
                    label: "Show error notification",
                  ),
                  const SizedBox(height: 10),
                  PanelKitButton(
                    type: PanelKitButtonType.secondary,
                    onPressed: () => controller.showNotification(
                        type: PanelKitNotificationType.warning,
                        title: "Warning!"),
                    label: "Show warning notification",
                  ),
                  const SizedBox(height: 10),
                  PanelKitButton(
                    type: PanelKitButtonType.secondary,
                    onPressed: () => controller.showNotification(
                        type: PanelKitNotificationType.info, title: "Info!"),
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
                    onPressed: () =>
                        controller.showDialg(PanelKitDialogType.confirmation),
                    label: "Show confirmation dialog",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PanelKitButton(
                    type: PanelKitButtonType.secondary,
                    onPressed: () =>
                        controller.showDialg(PanelKitDialogType.custom),
                    label: "Show confirmation custom dialog",
                  ),
                ],
              ),
            ),
          ],
        );
}
