import 'package:flutter/material.dart';
import 'package:panel_kit/buttons.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
