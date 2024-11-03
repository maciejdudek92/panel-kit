import 'package:flutter/material.dart';
import 'package:panely/components/buttons.dart';
import 'package:panely/components/notification.dart';
import 'package:panely/panely.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Panely.of(context).controller;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PanelyButton(
          type: PanelyButtonType.secondary,
          onPressed: () => controller.showNotification(type: PanelyNotificationType.success, title: "Success!"),
          label: "Show info notification",
        ),
        const SizedBox(height: 10),
        PanelyButton(
          type: PanelyButtonType.secondary,
          onPressed: () => controller.showNotification(type: PanelyNotificationType.error, title: "Error!"),
          label: "Show error notification",
        ),
        const SizedBox(height: 10),
        PanelyButton(
          type: PanelyButtonType.secondary,
          onPressed: () => controller.showNotification(type: PanelyNotificationType.warning, title: "Warning!"),
          label: "Show warning notification",
        ),
        const SizedBox(height: 10),
        PanelyButton(
          type: PanelyButtonType.secondary,
          onPressed: () => controller.showNotification(type: PanelyNotificationType.info, title: "Info!"),
          label: "Show info notification",
        ),
      ],
    );
  }
}
