import 'package:flutter/material.dart';
import 'package:panel_kit/panel_kit.dart';
import 'package:panel_kit/components/buttons.dart';
import 'package:panel_kit/components/dialog.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Panely.of(context).controller;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PanelyButton(
          type: PanelyButtonType.secondary,
          onPressed: () => controller.showDialg(PanelyDialogType.confirmation),
          label: "Show confirmation dialog",
        ),
        const SizedBox(
          height: 10,
        ),
        PanelyButton(
          type: PanelyButtonType.secondary,
          onPressed: () => controller.showDialg(PanelyDialogType.custom),
          label: "Show confirmation custom dialog",
        ),
      ],
    );
  }
}
