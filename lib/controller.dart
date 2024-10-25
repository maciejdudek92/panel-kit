import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panel_kit/dialog.dart';
import 'package:panel_kit/navigator.dart';
import 'package:panel_kit/notification.dart';
import 'package:panel_kit/page.dart';
import 'package:panel_kit/theme.dart';
import 'package:uuid/uuid.dart';
import 'package:collection/collection.dart';

class PanelKitController with ChangeNotifier {
  PanelKitController() {
    GetIt.I.registerSingleton<PanelKitController>(this);
    navigationRestorationScopeId = const Uuid().v4();
  }
  late final String navigationRestorationScopeId;

  late PanelKitNavigator _navigator;

  late String _panelTitle;
  String get panelTitle => _panelTitle;

  late PanelKitTheme _theme;
  late PanelKitNotification _notification;
  late PanelKitDialog _dialog;
  PanelKitTheme get theme => _theme;

  bool isPageActive(PanelKitPage page) => _navigator.isPageActive(page);
  Widget navigatorBuilder(context) => _navigator.build(context);

  init(
    BuildContext context, {
    required String panelTitle,
    required PanelKitTheme theme,
    required PanelKitPage startPage,
    required String pageTitle,
  }) {
    _theme = theme;
    _notification = PanelKitNotification(context: context);
    _dialog = PanelKitDialog(context: context);
    _panelTitle = panelTitle;
    _navigator = PanelKitNavigator(
      restorationScopeId: navigationRestorationScopeId,
      startPage: startPage,
    );
    notifyListeners();
  }

  void showNotification(
          {required PanelKitNotificationType type,
          required String title,
          String? description,
          autoCloseDuration = const Duration(seconds: 5)}) =>
      _notification.show(
          type: type,
          title: title,
          description: description,
          autoCloseDuration: autoCloseDuration);

  void showDialg(PanelKitDialogType type) {
    if (type == PanelKitDialogType.custom) {
      _dialog.showCustom(
        title: "aaaa",
        child: const SizedBox(
          height: 200,
          width: 200,
        ),
      );
    }
    if (type == PanelKitDialogType.confirmation) {
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

  void navigateTo(PanelKitPage page) {
    _navigator.navigateTo(page: page);
    notifyListeners();
  }

  void setNewRoute(PanelKitPage page) {
    _navigator.setNewRoute(page);
    notifyListeners();
  }

  void navigateBack([int? index, dynamic data]) {
    _navigator.navigateBack(index: index, data: data);
    notifyListeners();
  }
}
