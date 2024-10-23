import 'package:flutter/material.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/headers.dart';
import 'package:provider/provider.dart';

abstract class DefaultPanelKitPage extends StatelessWidget {
  final String title;
  const DefaultPanelKitPage({super.key, required this.title});
}

class PanelKitPage extends DefaultPanelKitPage {
  final Widget? header;
  late Widget _header;
  final List<PageTab>? tabs;
  final Widget Function(BuildContext context)? builder;

  bool showLoadingIndicator;

  PanelKitPage({
    required super.title,
    this.builder,
    this.tabs,
    super.key,
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

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PanelKitController>();
    double size = controller.getScreenSize(context).width;

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
      child = builder!(context);
    } else {
      child = TabBarView(children: tabs!.map((tab) => tab.child).toList());
    }

    return DefaultTabController(
      length: tabs != null ? tabs!.length : 0,
      child: Builder(
        builder: (context) {
          switch (size) {
            case <= 768:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _header,
                  Expanded(
                    flex: 9,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: child,
                    ),
                  ),
                ],
              );
            default:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _header,
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
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
