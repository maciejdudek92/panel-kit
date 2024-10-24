// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/page_header.dart';
import 'package:uuid/uuid.dart';

abstract class DefaultPanelKitPage extends StatelessWidget {
  final String routeId;
  final String title;
  DefaultPanelKitPage({super.key, required this.title}) : routeId = const Uuid().v4();
}

class PanelKitPage extends DefaultPanelKitPage {
  final Widget? header;
  late Widget _header;
  final List<PanelKitPageTab>? tabs;
  final Widget Function(BuildContext context, PanelKitController controller)? builder;
  final controller = GetIt.I<PanelKitController>();
  bool showLoadingIndicator;

  PanelKitPage({
    super.key,
    required super.title,
    this.builder,
    this.tabs,
    this.showLoadingIndicator = false,
    this.header,
  }) {
    if (tabs == null && builder == null) throw Exception("Tabs or builder is required");
    if (tabs != null && builder != null) throw Exception("Cant have both tabs and builder");
  }

  final Widget _loadingWidget = const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(
          height: 10,
        ),
        Text(
          "Trwa ładowanie danych...",
        ),
      ],
    ),
  );

  Widget render({required Widget child}) {
    if (builder != null) {
      return child;
    }
    return DefaultTabController(length: tabs != null ? tabs!.length : 0, child: child);
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    if (showLoadingIndicator) {
      return _loadingWidget;
    }

    if (header == null) {
      if (tabs != null) {
        _header = PanelKitPageHeaderWithTabs(title: title, tabs: tabs!);
      } else {
        _header = PanelKitPageHeader(title: title);
      }
    } else {
      _header = header!;
    }

    Widget child;
    if (builder != null) {
      child = builder!(context, controller);
    } else {
      child = TabBarView(children: tabs!.map((tab) => tab.builder(context, controller)).toList());
    }

    return render(
      child: Builder(
        builder: (context) {
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
