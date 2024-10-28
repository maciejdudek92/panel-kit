import 'package:flutter/material.dart';
import 'package:panel_kit/buttons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PanelKitButton(
          type: PanelKitButtonType.secondary,
          // onPressed: () => controller.setMainPage,
          label: "Show confirmation dialog",
        ),
      ],
    );
  }
}
