import 'package:flutter/material.dart';
import 'package:panely/components/buttons.dart';
import 'package:panely/components/dialog.dart';
import 'package:panely/panely.dart';

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
