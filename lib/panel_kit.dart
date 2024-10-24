// ignore_for_file: must_be_immutable

library panel_kit;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panel_kit/app_bar.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/menu.dart';
import 'package:panel_kit/menu_item.dart';
import 'package:panel_kit/theme.dart';
import 'package:provider/provider.dart';

class PanelKit extends StatefulWidget {
  final String panelTitle;
  final PanelKitMenu menu;
  final PanelKitController controller;
  final PanelKitTheme theme;
  PanelKitAppBar appBar;

  PanelKit({
    super.key,
    required this.controller,
    required this.menu,
    required this.panelTitle,
    PanelKitTheme? theme,
    PanelKitAppBar? appBar,
  })  : theme = theme ?? PanelKitTheme(),
        appBar = appBar ?? const PanelKitAppBar();

  @override
  State<PanelKit> createState() => _PanelKitState();
}

class _PanelKitState extends State<PanelKit> {
  final controller = GetIt.I<PanelKitController>();

  @override
  void initState() {
    if (widget.menu.menuItems.isEmpty) throw Exception("Menu items length must be greater than 0");
    if (widget.menu.menuItems.first.runtimeType != PanelKitMenuItem) throw Exception("First item in menu items must have type of PanelKitMenuItem");
    controller.init(
      context,
      panelTitle: widget.panelTitle,
      theme: widget.theme,
      startPage: (widget.menu.menuItems.first as PanelKitMenuItem).page,
      pageTitle: (widget.menu.menuItems.first as PanelKitMenuItem).title,
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PanelKitController>.value(
      value: controller,
      builder: (context, child) {
        double size = MediaQuery.of(context).size.width;

        return Scaffold(
          backgroundColor: controller.theme.backgroundColor,
          appBar: widget.appBar,
          drawer: size <= 1024 ? widget.menu : null,
          body: RestorationScope(
            restorationId: controller.navigationRestorationScopeId,
            child: Builder(
              builder: (context) {
                switch (MediaQuery.of(context).size.width) {
                  case <= 1024:
                    return controller.navigatorBuilder(context);
                  default:
                    return Row(
                      children: [
                        widget.menu,
                        Expanded(
                          child: controller.navigatorBuilder(context),
                        )
                      ],
                    );
                }
              },
            ),
          ),
        );

        // body,
      },
    );
  }
}
