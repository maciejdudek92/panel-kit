import 'package:flutter/material.dart';
import 'package:panel_kit/page.dart';

class EmptyPage extends PanelKitPage {
  EmptyPage({super.key})
      : super(
          title: "Empty Page",
          builder: (context, controller) => Container(),
        );
}
