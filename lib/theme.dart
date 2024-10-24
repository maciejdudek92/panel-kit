import 'dart:ui';
import 'package:flutter/material.dart';

class PanelKitDialogTheme {
  final Divider divider;
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle headerTextStyle;
  final TextStyle descriptionTextStyle;

  const PanelKitDialogTheme({
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

class PanelKitNotificationTheme {
  final Color backgroundColor;
  final Color borderColor;

  const PanelKitNotificationTheme({
    this.backgroundColor = const Color(0xFF131314),
    this.borderColor = const Color(0xFF424242),
  });
}

class PanelKitMenuTheme {
  final Color backgroundColor;
  final Color menuItemBackgroundColor;
  final Color disabledMenuItemBackgroundColor;
  final Color activedMenuItemBackgroundColor;
  final TextStyle menuItemTextStyle;
  final TextStyle activeMenuItemTextStyle;
  final TextStyle disabledMenuItemTextStyle;

  const PanelKitMenuTheme({
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

class PanelKitPageTheme {
  final Color backgroundColor;
  final Color headerBackgroundColor;
  final TextStyle headerTextStyle;
  const PanelKitPageTheme({
    this.backgroundColor = const Color(0xFF131314),
    this.headerBackgroundColor = const Color(0xFF1B1B18),
    this.headerTextStyle = const TextStyle(
      fontFamily: "Poppins",
      fontSize: 26,
      fontWeight: FontWeight.w500,
    ),
  });
}

class PanelKitButtonsTheme {
  final TextStyle textStyle;
  final Color primaryBackgroundColor;
  final Color secondaryBackgroundColor;
  final TextStyle disabledButtonTextStyle;
  final Color disabledButtonColor;

  const PanelKitButtonsTheme({
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

class PanelKitTheme {
  PanelKitPageTheme page;
  PanelKitMenuTheme menu;
  PanelKitButtonsTheme button;
  PanelKitDialogTheme dialog;
  PanelKitNotificationTheme notification;

  Color primaryAccentColor;
  Color backgroundColor;
  Color borderColor;

  PanelKitTheme({
    Color? primaryAccentColor,
    Color? backgroundColor,
    Color? borderColor,
    PanelKitPageTheme? page,
    PanelKitMenuTheme? menu,
    PanelKitButtonsTheme? button,
    PanelKitDialogTheme? dialog,
    PanelKitNotificationTheme? notification,
  })  : primaryAccentColor = primaryAccentColor ?? const Color(0xFFD32F2F),
        backgroundColor = backgroundColor ?? const Color(0xFF131314),
        borderColor = borderColor ?? const Color(0xFF424242),
        page = page ??
            PanelKitPageTheme(
              backgroundColor: backgroundColor ?? const Color(0xFF131314),
            ),
        menu = menu ??
            PanelKitMenuTheme(
              backgroundColor: backgroundColor ?? const Color(0xFF131314),
            ),
        button = button ??
            PanelKitButtonsTheme(
              primaryBackgroundColor: primaryAccentColor ?? const Color(0xFFD32F2F),
              secondaryBackgroundColor: backgroundColor ?? const Color(0xFF131314),
            ),
        dialog = dialog ??
            PanelKitDialogTheme(
              backgroundColor: backgroundColor ?? const Color(0xFF131314),
              borderColor: borderColor ?? const Color(0xFF424242),
            ),
        notification = notification ??
            PanelKitNotificationTheme(
              backgroundColor: backgroundColor ?? const Color(0xFF131314),
              borderColor: borderColor ?? const Color(0xFF424242),
            );
}
