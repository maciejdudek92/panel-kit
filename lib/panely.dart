// ignore_for_file: must_be_immutable

library panely;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panely/components/sidebar/sidebar_widget.dart';
import 'package:panely/controller.dart';
import 'package:panely/theme.dart';
import 'package:panely/components/app_bar.dart';
import 'package:panely/components/sidebar/sidebar.dart';
import 'package:panely/components/sidebar/sidebar_configuration.dart';
import 'package:provider/provider.dart';

class Panely extends StatefulWidget {
  final String panelTitle;
  final PanelySidebar sidebar;
  final PanelyController controller;
  final PanelyTheme theme;
  PanelyAppBar appBar;

  Panely({
    super.key,
    required this.controller,
    required this.sidebar,
    required this.panelTitle,
    PanelyTheme? theme,
    PanelyAppBar? appBar,
  })  : theme = theme ?? PanelyTheme(),
        appBar = appBar ?? const PanelyAppBar();

  static _PanelyState of(BuildContext context) {
    final _PanelyState? result = context.findAncestorStateOfType<_PanelyState>();
    if (result != null) {
      return result;
    }
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
        'Panely.of() called with a context that does not contain a Panely.',
      ),
      context.describeElement('The context used was'),
    ]);
  }

  @override
  State<Panely> createState() => _PanelyState();
}

class _PanelyState extends State<Panely> {
  final controller = GetIt.I<PanelyController>();
  late final Widget _navigatorBuilder;

  @override
  void initState() {
    if (widget.sidebar.menuItems.isEmpty) throw Exception("Menu items length must be greater than 0");
    if (widget.sidebar.menuItems.first.runtimeType != PanelySidebarButton) throw Exception("First item in menu items must have type of PanelySidebarButton");

    controller.init(
      context,
      sidebarConfiguration: widget.sidebar.configuration,
      panelTitle: widget.panelTitle,
      theme: widget.theme,
      startPage: (widget.sidebar.menuItems.first as PanelySidebarButton).page,
      pageTitle: (widget.sidebar.menuItems.first as PanelySidebarButton).title,
    );
    _navigatorBuilder = controller.navigatorBuilder(context);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PanelyController>.value(
      value: controller,
      builder: (context, child) {
        PanelySidebar? sidebar() {
          switch (controller.sidebarConfiguration.getCurrentView(context)) {
            case PanelySidebarViewMode.mobile:
              return widget.sidebar;
            default:
              return null;
          }
        }

        Widget body() {
          if (controller.sidebarConfiguration.getCurrentView(context) == PanelySidebarViewMode.mobile) return _navigatorBuilder;
          return Row(
            children: [
              widget.sidebar,
              Expanded(
                child: _navigatorBuilder,
              )
            ],
          );
        }

        return Theme(
          data: ThemeData.dark(),
          child: Scaffold(
            backgroundColor: controller.theme.backgroundColor,
            appBar: widget.appBar,
            drawer: sidebar(),
            body: RestorationScope(
              restorationId: controller.navigationRestorationScopeId,
              child: Builder(
                builder: (context) => body(),
              ),
            ),
          ),
        );

        // body,
      },
    );
  }
}
