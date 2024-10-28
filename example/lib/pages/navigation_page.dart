import 'package:flutter/material.dart';
import 'package:panel_kit/buttons.dart';
import 'package:panel_kit/page.dart';
import 'package:panel_kit/panel_kit.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PanelKit.of(context).controller;

    return Center(
      child: PanelKitButton(
        type: PanelKitButtonType.secondary,
        onPressed: () => controller.navigateTo(
          PanelKitPage(
            title: "Next(1) Page Example",
            builder: (context, controller, setState) => Center(
              child: PanelKitButton(
                type: PanelKitButtonType.secondary,
                onPressed: () => controller.navigateTo(
                  PanelKitPage(
                    title: "Next(2) Page Example",
                    builder: (context, controller, setState) => Center(
                      child: PanelKitButton(
                        type: PanelKitButtonType.secondary,
                        onPressed: () => controller.navigateTo(
                          PanelKitPage(
                            title: "Next(3) Page Example",
                            builder: (context, controller, setState) => const Center(
                              child: Text(
                                "Next(3) empty page.\nOn desktop use breadcumbs to navigate to previous page.\nOn mobile use back button to navigate to previous page.",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        label: "Navigate to next page (3)",
                      ),
                    ),
                  ),
                ),
                label: "Navigate to next page (2)",
              ),
            ),
          ),
        ),
        label: "Navigate to next page (1)",
      ),
    );
  }
}
