import 'package:flutter/material.dart';

import 'package:panely/components/buttons.dart';
import 'package:panely/components/content_page/content_page.dart';
import 'package:panely/panely.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Panely.of(context).controller;

    return Center(
      child: PanelyButton(
        type: PanelyButtonType.secondary,
        onPressed: () => controller.navigateTo(
          PanelyContentPage(
            title: "Next(1) Page Example",
            builder: (context, controller, setState) => Center(
              child: PanelyButton(
                type: PanelyButtonType.secondary,
                onPressed: () => controller.navigateTo(
                  PanelyContentPage(
                    title: "Next(2) Page Example",
                    builder: (context, controller, setState) => Center(
                      child: PanelyButton(
                        type: PanelyButtonType.secondary,
                        onPressed: () => controller.navigateTo(
                          PanelyContentPage(
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
