import 'package:flutter/material.dart';
import 'package:panel_kit/buttons.dart';
import 'package:panel_kit/page.dart';

class SettingsPage extends PanelKitPage {
  SettingsPage({super.key})
      : super(
          title: "Settings Example",
          builder: (context, controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PanelKitButton(
                type: PanelKitButtonType.secondary,
                // onPressed: () => controller.setMainPage,
                label: "Show confirmation dialog",
              ),
            ],
          ),
        );
}
