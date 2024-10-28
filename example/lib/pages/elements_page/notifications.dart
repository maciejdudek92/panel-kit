import 'package:flutter/material.dart';
import 'package:panel_kit/buttons.dart';
import 'package:panel_kit/notification.dart';
import 'package:panel_kit/panel_kit.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PanelKit.of(context).controller;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PanelKitButton(
          type: PanelKitButtonType.secondary,
          onPressed: () => controller.showNotification(type: PanelKitNotificationType.success, title: "Success!"),
          label: "Show info notification",
        ),
        const SizedBox(height: 10),
        PanelKitButton(
          type: PanelKitButtonType.secondary,
          onPressed: () => controller.showNotification(type: PanelKitNotificationType.error, title: "Error!"),
          label: "Show error notification",
        ),
        const SizedBox(height: 10),
        PanelKitButton(
          type: PanelKitButtonType.secondary,
          onPressed: () => controller.showNotification(type: PanelKitNotificationType.warning, title: "Warning!"),
          label: "Show warning notification",
        ),
        const SizedBox(height: 10),
        PanelKitButton(
          type: PanelKitButtonType.secondary,
          onPressed: () => controller.showNotification(type: PanelKitNotificationType.info, title: "Info!"),
          label: "Show info notification",
        ),
      ],
    );
  }
}
