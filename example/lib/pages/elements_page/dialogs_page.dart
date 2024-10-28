import 'package:flutter/material.dart';
import 'package:panel_kit/buttons.dart';
import 'package:panel_kit/dialog.dart';
import 'package:panel_kit/panel_kit.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PanelKit.of(context).controller;

    return Column(
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
    );
  }
}
