import 'package:flutter/material.dart';
import 'package:panel_kit/notifications.dart';
import 'package:panel_kit/page.dart';
import 'package:panel_kit/theme.dart';
import 'package:toastification/toastification.dart';

class PanelKitController with ChangeNotifier {
  bool _isInitialized = false;
  late PanelKitPage _selectedPage;
  PanelKitPage get selectedPage => _selectedPage;
  late PanelKitTheme _theme;
  late PanelKitNotification _notification;
  PanelKitTheme get theme => _theme;

  init({required String title, required PanelKitTheme theme, required PanelKitPage startPage}) {
    _theme = theme;
    _notification = PanelKitNotification(theme);
    _isInitialized = true;
    notifyListeners();
  }

  Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  void setPage(PanelKitPage page) {
    _selectedPage = page;
    notifyListeners();
  }

  void showNotification({required PanelKitNotificationType type, required String text, String? description, autoCloseDuration = const Duration(seconds: 5)}) => _notification.show(type: type, text: text, description: description, autoCloseDuration: autoCloseDuration);

  // void showDialg(yype, text) {}
}
