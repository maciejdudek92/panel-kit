import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panel_kit/controller.dart';
import 'package:toastification/toastification.dart';

enum PanelKitNotificationType {
  info,
  warning,
  success,
  error,
}

class PanelKitNotification {
  BuildContext context;

  PanelKitNotification({
    required this.context,
  });

  void show({
    required PanelKitNotificationType type,
    required String title,
    String? description,
    autoCloseDuration = const Duration(seconds: 5),
    AlignmentGeometry? alignment,
  }) {
    final theme = GetIt.I<PanelKitController>().theme;

    toastification.show(
      context: context,
      type: ToastificationType.values
          .firstWhere((value) => value.name == type.name),
      alignment: alignment,
      title: Text(
        title,
        style: theme.notification.titleTextStyle,
      ),
      dragToClose: true,
      description: description != null
          ? Text(
              description,
              style: theme.notification.descriptionTextStyle,
            )
          : null,
      backgroundColor: theme.notification.backgroundColor,
      foregroundColor: theme.notification.closeIconColor,
      borderSide: BorderSide(
        color: theme.notification.borderColor,
      ),
      showProgressBar: false,
      autoCloseDuration: autoCloseDuration,
    );
  }
}
