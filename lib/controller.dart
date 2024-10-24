import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panel_kit/dialog.dart';
import 'package:panel_kit/navigator.dart';
import 'package:panel_kit/notification.dart';
import 'package:panel_kit/page.dart';
import 'package:panel_kit/theme.dart';
import 'package:uuid/uuid.dart';

class ActiveMainPage {
  String title;
  PanelKitPage mainPage;
  ActiveMainPage({required this.title, required this.mainPage});
}

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

  PanelKitPage get mainPage => _navigator.mainPage.value;
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

  void showNotification({required PanelKitNotificationType type, required String text, String? description, autoCloseDuration = const Duration(seconds: 5)}) => _notification.show(type: type, text: text, description: description, autoCloseDuration: autoCloseDuration);

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

  bool get isMainPageActive => _navigator.subpages.isEmpty;

  List<Map<String, dynamic>> get breadCumbsData => [
        {
          "title": mainPage.title,
          "style": isMainPageActive ? theme.button.disabledButtonTextStyle : null,
          "action": isMainPageActive ? null : () => navigateBackToMainPage(),
        },
        ..._navigator.subpages.map(
          (subpage) {
            bool isLast = _isSubpageLast(subpage);
            return {
              "title": subpage.title,
              "style": isLast ? theme.button.disabledButtonTextStyle : null,
              "action": isLast ? null : () => navigateBack(subpage),
            };
          },
        ),
      ];

  bool _isSubpageLast(subpage) {
    int index = _navigator.subpages.indexOf(subpage);
    return _navigator.subpages.length - 1 == index;
  }

  void setMainPage(PanelKitPage mainPage) {
    _navigator.setMainPage(mainPage);
    notifyListeners();
  }

  void navigateTo(PanelKitPage subpage) {
    _navigator.navigateTo(type: PanelKitNavigatorRoutes.subpage, subpage: subpage);
    notifyListeners();
  }

  void navigateBack([PanelKitPage? subpage, dynamic data]) {
    _navigator.navigateTo(type: PanelKitNavigatorRoutes.previous, subpage: subpage, data: data);
    notifyListeners();
  }

  void navigateBackToMainPage() {
    _navigator.navigateTo(type: PanelKitNavigatorRoutes.mainPage);
    notifyListeners();
  }
}
