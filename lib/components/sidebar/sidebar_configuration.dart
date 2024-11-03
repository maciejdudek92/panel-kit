import 'package:flutter/material.dart';

enum PanelySidebarViewMode {
  mobile,
  desktop,
  responsive;
}

enum PanelySidebarPosition {
  left,
  right;
}

class PanelyResponsiveSidebarConfiguration {
  final double breakpoint;
  const PanelyResponsiveSidebarConfiguration({this.breakpoint = 1024});
}

// class PanelyMobileSidebarConfiguration {
//   const PanelyMobileSidebarConfiguration();
// }

// class PanelyDesktopSidebarConfiguration {
//   const PanelyDesktopSidebarConfiguration();
// }

class PanelySidebarConfiguration {
  final PanelySidebarPosition position;
  final PanelySidebarViewMode viewMode;

  PanelySidebarViewMode getCurrentView(BuildContext context) {
    final double breakpoint = responsive.breakpoint;
    Size size = MediaQuery.of(context).size;

    if (viewMode == PanelySidebarViewMode.responsive && size.width <= breakpoint) {
      return PanelySidebarViewMode.mobile;
    } else if (viewMode == PanelySidebarViewMode.responsive && size.width < breakpoint) {
      return PanelySidebarViewMode.desktop;
    } else if (viewMode == PanelySidebarViewMode.mobile) {
      return PanelySidebarViewMode.mobile;
    } else {
      return PanelySidebarViewMode.desktop;
    }
  }

  final PanelyResponsiveSidebarConfiguration responsive;
  // final PanelyMobileSidebarConfiguration mobile;
  // final PanelyDesktopSidebarConfiguration desktop;

  const PanelySidebarConfiguration({
    this.position = PanelySidebarPosition.left,
    this.viewMode = PanelySidebarViewMode.responsive,
    this.responsive = const PanelyResponsiveSidebarConfiguration(),
    // this.mobile = const PanelyMobileSidebarConfiguration(),
    // this.desktop = const PanelyDesktopSidebarConfiguration(),
  });
}
