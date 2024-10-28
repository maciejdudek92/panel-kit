// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/page_header.dart';
import 'package:uuid/uuid.dart';

class PanelKitPage extends StatelessWidget {
  final String routeId;
  final String title;

  final Widget? header;
  late Widget _header;
  final List<PanelKitPageTab>? tabs;
  final Widget Function(BuildContext context, PanelKitController controller, void Function(void Function()) setState)? builder;
  final controller = GetIt.I<PanelKitController>();

  PanelKitPage({
    super.key,
    this.header,
    required this.title,
    required this.builder,
  })  : routeId = const Uuid().v4(),
        tabs = null;

  PanelKitPage._tabs({
    required this.title,
    required this.tabs,
    this.header,
  })  : routeId = const Uuid().v4(),
        builder = null;

  factory PanelKitPage.withTabs({
    Widget? header,
    required String title,
    required List<PanelKitPageTab>? tabs,
  }) =>
      PanelKitPage._tabs(header: header, title: title, tabs: tabs);

  Widget render({required Widget child}) {
    if (builder != null) {
      return child;
    }
    return DefaultTabController(length: tabs != null ? tabs!.length : 0, child: child);
  }

  @protected
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    if (header == null) {
      if (tabs != null) {
        _header = PanelKitPageHeaderWithTabs(title: title, tabs: tabs!);
      } else {
        _header = PanelKitPageHeader(title: title);
      }
    } else {
      _header = header!;
    }

    return render(
      child: StatefulBuilder(
        builder: (context, setState) {
          Widget child;
          if (builder != null) {
            child = builder!(context, controller, setState);
          } else {
            child = TabBarView(children: tabs!.map((tab) => tab.builder(context, controller)).toList());
          }

          switch (size) {
            case <= 1024:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _header,
                  Expanded(
                    flex: 9,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 50, 50, 5),
                      child: child,
                    ),
                  ),
                ],
              );
            default:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _header,
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 50, 50, 5),
                      child: child,
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
