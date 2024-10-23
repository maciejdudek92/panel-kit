import 'package:flutter/material.dart';
import 'package:panel_kit/theme.dart';
import 'package:toastification/toastification.dart';

enum PanelKitNotificationType {
  info,
  warning,
  success,
  error,
}

class PanelKitNotification {
  PanelKitNotification(PanelKitTheme theme);

  void show({required PanelKitNotificationType type, required String text, String? description, autoCloseDuration = const Duration(seconds: 5)}) => toastification.show(
        type: ToastificationType.values.firstWhere((value) => value.name == type.name),
        title: Text(
          "$text",
        ),
        description: description != null
            ? Text(
                description,
              )
            : null,
        // backgroundColor: kcSecondaryBackgroundColor,
        borderSide: BorderSide(
            // color: kcPrimaryBorderColor,
            ),
        showProgressBar: false,
        // foregroundColor: kcWhite,
        autoCloseDuration: autoCloseDuration,
      );
}
