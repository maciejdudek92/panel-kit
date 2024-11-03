import 'package:flutter/material.dart';
import 'package:panely/components/buttons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PanelyButton(
          type: PanelyButtonType.secondary,
          // onPressed: () => controller.setMainPage,
          label: "Show confirmation dialog",
        ),
      ],
    );
  }
}
