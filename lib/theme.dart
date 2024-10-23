import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class PanelKitTheme {
  Color contentBackground;
  Color headerBackground;
  Color menuBackground;
  Color primaryColor;
  Color borderColor;
  TextStyle headerTextStyle;
  TextStyle menuItemTextStyle;
  TextStyle activeMenuItemTextStyle;
  TextStyle disabledMenuItemTextStyle;

  Divider divider;
  Color menuItemBackground;
  Color disabledMenuItemBackground;
  Color activedMenuItemBackground;

  PanelKitTheme({
    Color? contentBackground,
    Color? menuBackground,
    Color? primaryColor,
    Color? borderColor,
    Color? headerBackground,
    TextStyle? headerTextStyle,
    Color? menuItemBackground,
    Color? disabledMenuItemBackground,
    Color? activedMenuItemBackground,
    TextStyle? menuItemTextStyle,
    TextStyle? activeMenuItemTextStyle,
    TextStyle? disabledMenuItemTextStyle,
    Divider? divider,
  })  : contentBackground = contentBackground ?? Color(0xFF18181B),
        headerBackground = headerBackground ?? Color(0xFF2d2d31),
        menuBackground = menuBackground ?? Color(0xFF18181B),
        primaryColor = primaryColor ?? Colors.redAccent,
        borderColor = borderColor ?? Colors.grey.shade800,
        headerTextStyle = headerTextStyle ??
            GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
        divider = divider ??
            Divider(
              height: 1,
              color: primaryColor,
            ),
        menuItemBackground = menuItemBackground ?? Colors.transparent,
        disabledMenuItemBackground = disabledMenuItemBackground ?? Colors.grey.shade600,
        activedMenuItemBackground = activedMenuItemBackground ?? Color(0xFF2d2d31),
        menuItemTextStyle = menuItemTextStyle ??
            GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey,
            ),
        activeMenuItemTextStyle = activeMenuItemTextStyle ??
            GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
            ),
        disabledMenuItemTextStyle = disabledMenuItemTextStyle ??
            GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey.shade800,
            );
}
