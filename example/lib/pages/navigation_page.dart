import 'package:flutter/material.dart';
import 'package:panel_kit/buttons.dart';
import 'package:panel_kit/page.dart';

class NavigationPage extends PanelKitPage {
  NavigationPage({super.key})
      : super(
          title: "Navigation Example",
          builder: (context, controller) => Center(
            child: PanelKitButton(
              type: PanelKitButtonType.secondary,
              onPressed: () => controller.navigateTo(
                PanelKitPage(
                  title: "Next(1) Page Example",
                  builder: (context, controller) => Center(
                    child: PanelKitButton(
                      type: PanelKitButtonType.secondary,
                      onPressed: () => controller.navigateTo(
                        PanelKitPage(
                          title: "Next(2) Page Example",
                          builder: (context, controller) => Center(
                            child: PanelKitButton(
                              type: PanelKitButtonType.secondary,
                              onPressed: () => controller.navigateTo(
                                PanelKitPage(
                                  title: "Next(3) Page Example",
                                  builder: (context, controller) =>
                                      const Center(
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
          ),
        );
}
