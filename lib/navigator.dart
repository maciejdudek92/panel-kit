import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panel_kit/controller.dart';
import 'package:panel_kit/page.dart';

enum PanelKitNavigatorRoutes {
  mainPage,
  subpage,
  previous;
}

// ignore: must_be_immutable
class PanelKitNavigator extends StatelessWidget {
  final String restorationScopeId;
  late ValueNotifier<PanelKitPage> _mainPage;
  final List<PanelKitPage> subpages = [];

  ValueNotifier<PanelKitPage> get mainPage => _mainPage;

  PanelKitNavigator({super.key, required PanelKitPage startPage, required this.restorationScopeId}) {
    _mainPage = ValueNotifier(startPage);
  }
  final controller = GetIt.I<PanelKitController>();
  BuildContext? _context;

  Route<Widget> _onGenerateRoute(RouteSettings settings) {
    PanelKitPage page;

    if (subpages.isEmpty) {
      page = _mainPage.value;
    } else {
      page = subpages.last;
    }
    return MaterialPageRoute(
      builder: (context) {
        if (_context != null) {
          if (!_context!.mounted) {
            _context = context;
          }
        } else {
          _context = context;
        }

        return page;
      },
      settings: settings,
    );
  }

  setMainPage(PanelKitPage mainPage) {
    _mainPage.value = mainPage;
    if (subpages.isNotEmpty) {
      subpages.clear();
      Navigator.popUntil(_context!, (Route<dynamic> predicate) => predicate.isFirst);
    }
    Navigator.push(
      _context!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => mainPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
  }

  navigateTo({required PanelKitNavigatorRoutes type, PanelKitPage? subpage, dynamic data}) {
    switch (type) {
      case PanelKitNavigatorRoutes.subpage:
        assert(subpage != null, "SubPage is required!");
        if (!subpages.contains(subpage)) {
          subpages.add(subpage!);
          Navigator.pushNamed(_context!, subpages.last.routeId);
        } else {
          subpages.removeRange(subpages.indexOf(subpage!) + 1, subpages.length);
          Navigator.popUntil(_context!, ModalRoute.withName(subpages.last.routeId));
        }
      case PanelKitNavigatorRoutes.previous:
        if (subpage != null) {
          subpages.removeRange(subpages.indexOf(subpage) + 1, subpages.length);
          Navigator.popUntil(_context!, ModalRoute.withName(subpages.last.routeId));
        } else {
          subpages.removeLast();
          Navigator.pop(_context!, data);
        }
      default:
        subpages.clear();
        Navigator.popUntil(_context!, ModalRoute.withName("/"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      restorationScopeId: restorationScopeId,
      initialRoute: "/",
      onGenerateRoute: _onGenerateRoute,
    );
  }
}
