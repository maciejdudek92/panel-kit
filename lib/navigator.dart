import 'package:flutter/material.dart';

import 'package:panel_kit/page.dart';

// ignore: must_be_immutable
class PanelKitNavigator extends StatelessWidget {
  final String restorationScopeId;
  final List<PanelKitPage> _pages = [];
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  PanelKitNavigator(
      {super.key,
      required PanelKitPage startPage,
      required this.restorationScopeId}) {
    _pages.add(startPage);
  }

  Route<Widget> _onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return _pages.last;
      },
      settings: settings,
    );
  }

  setNewRoute(PanelKitPage page) {
    if (_pages.length > 1) {
      Navigator.popUntil(navigatorKey.currentContext!,
          ModalRoute.withName(_pages.first.routeId));
    }
    _pages.clear();
    _pages.add(page);

    Navigator.push(
      navigatorKey.currentContext!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => _pages.last,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
    // }
  }

  bool get isFirstPageActive => _pages.length == 1;
  bool isPageActive(PanelKitPage page) {
    return _pages.last.routeId == page.routeId;
  }

  List<PanelKitPage> get pages => _pages;

  navigateBack({int? index, dynamic data}) {
    if (index != null) {
      _pages.removeRange(index + 1, _pages.length);
      Navigator.popUntil(navigatorKey.currentContext!,
          ModalRoute.withName(_pages.last.routeId));
      if (_pages.length == 1) setNewRoute(_pages.last);
    } else {
      _pages.removeLast();
      // Navigator.pop(navigatorKey.currentContext!, data);

      // Navigator.popUntil(navigatorKey.currentContext!, ModalRoute.withName(_pages.last.routeId));
      Navigator.pushReplacement(
        navigatorKey.currentContext!,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => _pages.last,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1.0, 0.0); // Slide from left to right
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );

            // return child;
          },
        ),
      );
    }
  }

  navigateTo({required PanelKitPage page, dynamic data}) {
    if (_pages.contains(page)) {
      int index = _pages.indexOf(page) + 1;
      _pages.removeRange(index, _pages.length);
      if (index == 0) {
        Navigator.popUntil(
            navigatorKey.currentContext!, ModalRoute.withName("/"));
      } else {
        Navigator.popUntil(navigatorKey.currentContext!,
            ModalRoute.withName(_pages.last.routeId));
      }
    } else {
      _pages.add(page);
      Navigator.pushNamed(navigatorKey.currentContext!, _pages.last.routeId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      restorationScopeId: restorationScopeId,
      initialRoute: "/",
      onGenerateRoute: _onGenerateRoute,
    );
  }
}
