library panel_kit;

import 'package:flutter/material.dart';
import 'package:panel_kit/app_bar.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/menu.dart';
import 'package:panel_kit/theme.dart';
import 'package:provider/provider.dart';

class PanelKit extends StatefulWidget {
  final String title;
  final PanelKitMenu menu;
  final PanelKitController controller;
  final PanelKitTheme theme;

  PanelKit({
    super.key,
    PanelKitController? controller,
    PanelKitTheme? theme,
    required this.menu,
    required this.title,
  })  : theme = theme ?? PanelKitTheme(),
        controller = controller ?? PanelKitController();
  @override
  State<PanelKit> createState() => _PanelKitState();
}

class _PanelKitState extends State<PanelKit> {
  @override
  void initState() {
    if (widget.menu.menuItems.isEmpty) throw Exception("Menu items length must be greater than 0");
    widget.controller.init(title: widget.title, theme: widget.theme, startPage: widget.menu.menuItems.first.page);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = widget.controller.getScreenSize(context).width;

    return ChangeNotifierProvider<PanelKitController>.value(
      value: widget.controller,
      builder: (context, child) {
        switch (size) {
          case <= 1024:
            return Scaffold(
              backgroundColor: widget.theme.contentBackground,
              appBar: PanelKitAppBar(title: widget.title),
              drawer: widget.menu,
              body: context.watch<PanelKitController>().selectedPage,
            );
          default:
            return Scaffold(
              appBar: PanelKitAppBar(title: widget.title),
              backgroundColor: widget.theme.contentBackground,
              body: Row(
                children: [
                  widget.menu,
                  Expanded(
                    child: context.watch<PanelKitController>().selectedPage,
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
