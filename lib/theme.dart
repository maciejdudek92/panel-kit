import 'package:flutter/material.dart';

class PanelyDialogTheme {
  final Divider divider;
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle headerTextStyle;
  final TextStyle descriptionTextStyle;

  const PanelyDialogTheme({
    this.backgroundColor = const Color(0xFF131314),
    this.borderColor = const Color(0xFF424242),
    this.divider = const Divider(
      height: 1,
      color: Color(0xFF424242),
    ),
    this.headerTextStyle = const TextStyle(
      fontFamily: "Poppins",
      fontSize: 26,
      fontWeight: FontWeight.w500,
    ),
    this.descriptionTextStyle = const TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
    ),
  });
}

class PanelyNotificationTheme {
  final Color backgroundColor;
  final Color closeIconColor;
  final Color borderColor;
  final TextStyle titleTextStyle;
  final TextStyle descriptionTextStyle;

  const PanelyNotificationTheme({
    this.backgroundColor = const Color(0xFF131314),
    this.borderColor = const Color(0xFF424242),
    this.closeIconColor = Colors.white,
    this.titleTextStyle = const TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      color: Colors.white,
    ),
    this.descriptionTextStyle = const TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      color: Colors.white,
    ),
  });
}

class PanelySidebarTheme {
  final Color backgroundColor;
  final Color menuItemBackgroundColor;
  final Color disabledMenuItemBackgroundColor;
  final Color activedMenuItemBackgroundColor;
  final TextStyle menuItemTextStyle;
  final TextStyle activeMenuItemTextStyle;
  final TextStyle disabledMenuItemTextStyle;

  const PanelySidebarTheme({
    this.backgroundColor = const Color(0xFF131314),
    this.menuItemBackgroundColor = const Color(0xff00000000), // transparent
    this.disabledMenuItemBackgroundColor = const Color(0xFF757575),
    this.activedMenuItemBackgroundColor = const Color(0xFF2d2d31),
    this.menuItemTextStyle = const TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      color: Colors.grey,
    ),
    this.activeMenuItemTextStyle = const TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      color: Colors.white,
    ),
    this.disabledMenuItemTextStyle = const TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      color: Color(0xFF424242),
    ),
  });
}

class PanelyContentPageTheme {
  final Color backgroundColor;
  final Color headerBackgroundColor;
  final TextStyle headerTextStyle;
  const PanelyContentPageTheme({
    this.backgroundColor = const Color(0xFF131314),
    this.headerBackgroundColor = const Color(0xFF1B1B18),
    this.headerTextStyle = const TextStyle(fontFamily: "Poppins", fontSize: 26, fontWeight: FontWeight.w500, color: Colors.white),
  });
}

class PanelyButtonsTheme {
  final TextStyle textStyle;
  final Color primaryBackgroundColor;
  final Color secondaryBackgroundColor;
  final TextStyle disabledButtonTextStyle;
  final Color disabledButtonColor;

  const PanelyButtonsTheme({
    this.primaryBackgroundColor = const Color(0xFFD32F2F),
    this.secondaryBackgroundColor = const Color(0xFF131314),
    this.disabledButtonColor = const Color(0xFF484842),
    this.textStyle = const TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      color: Colors.white,
    ),
    this.disabledButtonTextStyle = const TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      color: Colors.grey,
    ),
  });
}

class PanelyTheme {
  PanelyContentPageTheme page;
  PanelySidebarTheme menu;
  PanelyButtonsTheme button;
  PanelyDialogTheme dialog;
  PanelyNotificationTheme notification;

  Color primaryAccentColor;
  Color backgroundColor;
  Color borderColor;

  PanelyTheme({
    Color? primaryAccentColor,
    Color? backgroundColor,
    Color? borderColor,
    PanelyContentPageTheme? page,
    PanelySidebarTheme? menu,
    PanelyButtonsTheme? button,
    PanelyDialogTheme? dialog,
    PanelyNotificationTheme? notification,
  })  : primaryAccentColor = primaryAccentColor ?? const Color(0xFFD32F2F),
        backgroundColor = backgroundColor ?? const Color(0xFF131314),
        borderColor = borderColor ?? const Color(0xFF424242),
        page = page ??
            PanelyContentPageTheme(
              backgroundColor: backgroundColor ?? const Color(0xFF131314),
            ),
        menu = menu ??
            PanelySidebarTheme(
              backgroundColor: backgroundColor ?? const Color(0xFF131314),
            ),
        button = button ??
            PanelyButtonsTheme(
              primaryBackgroundColor: primaryAccentColor ?? const Color(0xFFD32F2F),
              secondaryBackgroundColor: backgroundColor ?? const Color(0xFF131314),
            ),
        dialog = dialog ??
            PanelyDialogTheme(
              backgroundColor: backgroundColor ?? const Color(0xFF131314),
              borderColor: borderColor ?? const Color(0xFF424242),
            ),
        notification = notification ??
            PanelyNotificationTheme(
              backgroundColor: backgroundColor ?? const Color(0xFF131314),
              borderColor: borderColor ?? const Color(0xFF424242),
            );
}
