import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panel_kit/navigator.dart';
import 'package:panel_kit/components/dialog.dart';
import 'package:panel_kit/components/notification.dart';
import 'package:panel_kit/theme.dart';
import 'package:panel_kit/components/content/content_page.dart';
import 'package:panel_kit/components/sidebar/sidebar_configuration.dart';
import 'package:uuid/uuid.dart';
import 'package:collection/collection.dart';

class PanelyController with ChangeNotifier {
  PanelyController() {
    GetIt.I.registerSingleton<PanelyController>(this);
    navigationRestorationScopeId = const Uuid().v4();
  }
  late final String navigationRestorationScopeId;

  late PanelyNavigator _navigator;

  late String _panelTitle;
  String get panelTitle => _panelTitle;

  late PanelyTheme _theme;
  late PanelyNotification _notification;
  late PanelyDialog _dialog;
  late PanelySidebarConfiguration _sidebarConfiguration;
  PanelySidebarConfiguration get sidebarConfiguration => _sidebarConfiguration;
  PanelyTheme get theme => _theme;

  bool isPageActive(PanelyContentPage page) => _navigator.isPageActive(page);
  Widget navigatorBuilder(context) => _navigator.build(context);

  init(
    BuildContext context, {
    required PanelySidebarConfiguration sidebarConfiguration,
    required String panelTitle,
    required PanelyTheme theme,
    required PanelyContentPage startPage,
    required String pageTitle,
  }) {
    _theme = theme;
    _notification = PanelyNotification(context: context);
    _dialog = PanelyDialog(context: context);
    _panelTitle = panelTitle;
    _sidebarConfiguration = sidebarConfiguration;
    _navigator = PanelyNavigator(
      restorationScopeId: navigationRestorationScopeId,
      startPage: startPage,
    );
    notifyListeners();
  }

  void showNotification({required PanelyNotificationType type, required String title, String? description, autoCloseDuration = const Duration(seconds: 5)}) => _notification.show(type: type, title: title, description: description, autoCloseDuration: autoCloseDuration);

  void showDialg(PanelyDialogType type) {
    if (type == PanelyDialogType.custom) {
      _dialog.showCustom(
        title: "aaaa",
        child: const SizedBox(
          height: 200,
          width: 200,
        ),
      );
    }
    if (type == PanelyDialogType.confirmation) {
      _dialog.showConfirmation(
        title: "aaaa",
        description: "aaaa",
      );
    }
  }

  bool get isFirstPageActive => _navigator.isFirstPageActive;

  List<Map<String, dynamic>> get breadCumbsData => [
        ..._navigator.pages.mapIndexed((index, page) {
          Function? action;

          bool isLast = index + 1 == _navigator.pages.length;
          bool isFirst = index == 0;

          if (!isLast && !isFirst) {
            action = () => navigateBack(index);
          }

          if (isFirst && !isLast) {
            action = () => navigateBack(0);
          }

          return {
            "title": page.title,
            "style": isLast ? theme.button.disabledButtonTextStyle : null,
            "action": action,
          };
        }),
      ];

  void navigateTo(PanelyContentPage page) {
    _navigator.navigateTo(page: page);
    notifyListeners();
  }

  void setNewRoute(PanelyContentPage page) {
    _navigator.setNewRoute(page);
    notifyListeners();
  }

  void navigateBack([int? index, dynamic data]) {
    _navigator.navigateBack(index: index, data: data);
    notifyListeners();
  }
}
