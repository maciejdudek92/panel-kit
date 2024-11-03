import 'package:flutter/material.dart';
import 'package:panel_kit/components/buttons.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PanelyButton(
          type: PanelyButtonType.primary,
          onPressed: () {},
          label: "Primary",
        ),
        const SizedBox(height: 10),
        PanelyButton(
          type: PanelyButtonType.secondary,
          onPressed: () {},
          label: "Secondary",
        ),
        const SizedBox(height: 10),
        PanelyButton(
          onPressed: null,
          label: "Disabled",
        ),
      ],
    );
  }
}
