import 'package:flutter/material.dart';
import 'package:panel_kit/controller.dart';
import 'package:provider/provider.dart';

class PanelKitAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  PanelKitAppBar({required this.title});
  @override
  Widget build(BuildContext context) {
    final controller = context.read<PanelKitController>();
    double size = controller.getScreenSize(context).width;

    switch (size) {
      case <= 1024:
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: controller.theme.borderColor),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: Builder(
              builder: (context) {
                return Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu),
                      color: controller.theme.primaryColor,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    Row(
                      children: [
                        // _dasboardLogo,
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            title,
                            // style: TextStyle(fontFamily: 'Bangers'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("/"),
                        ),
                        Text(context.watch<PanelKitController>().selectedPage.title),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15.0),
                    //   child: Text(
                    //     controller.title,
                    //     style: TextStyle(fontFamily: 'Bangers'),
                    //   ),
                    // ),
                  ],
                );
              },
            ),
          ),
        );
      default:
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: controller.theme.borderColor),
            ),
          ),
          child: AppBar(
            toolbarHeight: 150,
            backgroundColor: Colors.transparent,
            // decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.grey), left: BorderSide(width: 1, color: Colors.grey))),

            actions: [
              TextButton(
                onPressed: () {},
                child: Text(context.watch<PanelKitController>().selectedPage.title),
              ),
            ],
            leading: SizedBox(
              child: Row(
                children: [
                  // _dasboardLogo,
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      title,
                      style: TextStyle(fontFamily: 'Bangers'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("/"),
                  ),
                  Text(context.watch<PanelKitController>().selectedPage.title),
                ],
              ),
            ),
          ),
        );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
