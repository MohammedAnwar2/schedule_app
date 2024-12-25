// ignore_for_file: use_full_hex_values_for_flutter_colors, constant_identifier_names

import 'package:flutter/material.dart';

List<Color> colors = [
  Color(0xff75E0C6),
  Color(0xffE6B3E7),
  Color(0xffE8F0C5),
  Color(0xff86A8D4),
  Color(0xff90E2A7),
  Color(0xffF08E94),
  Color(0xff00a010),
];

class AppColorScheme {
  ColorScheme colorSchemeLightMode = const ColorScheme.light(
    primary: AppColorsLightTheme.primaryColor,
    secondary: AppColorsLightTheme.secondaryColor,
    background: AppColorsLightTheme.backgroundColor,
    onPrimary: AppColorsLightTheme.textColor,
    onBackground: AppColorsLightTheme.iconMaskColor,
    onSecondary: AppColorsLightTheme.iconColor,
    onSecondaryContainer: AppColorsLightTheme.overlayColor,
    onSurface: AppColorsLightTheme.classCarColor,
    outline: AppColorsLightTheme.classCarColor1,
    surfaceTint: AppColorsLightTheme.classCarColor1,
    onSurfaceVariant: AppColorsLightTheme.classesBorderColor,
    onTertiary: AppColorsLightTheme.classesBorderColor1,
    onTertiaryContainer: AppColorsLightTheme.LogoSecondary,
    error: AppColorsLightTheme.Errorcolor,
    shadow: AppColorsLightTheme.IconsColor,
    scrim: AppColorsLightTheme.subtextColor,
  );
  ColorScheme colorSchemeDarkMode = const ColorScheme.dark(
    primary: AppColorsDarkTheme.primaryColor,
    secondary: AppColorsDarkTheme.secondaryColor,
    background: AppColorsDarkTheme.backgroundColor,
    onPrimary: AppColorsDarkTheme.textColor,
    onBackground: AppColorsDarkTheme.iconMaskColor,
    onSecondary: AppColorsDarkTheme.iconColor,
    onSecondaryContainer: AppColorsDarkTheme.overlayColor,
    onSurface: AppColorsDarkTheme.classCarColor,
    outline: AppColorsDarkTheme.classCarColor1,
    surfaceTint: Color.fromARGB(57, 255, 232, 82),
    onSurfaceVariant: AppColorsDarkTheme.classesBorderColor,
    onTertiary: AppColorsDarkTheme.classesBorderColor1,
    onTertiaryContainer: AppColorsDarkTheme.LogoSecondary,
    error: AppColorsDarkTheme.Errorcolor,
    shadow: AppColorsDarkTheme.IconsColor,
    scrim: AppColorsDarkTheme.subtextColor,
  );
}

class AppColorsLightTheme {
  // Light Theme Colors
  static const Color primaryColor = Color(0xff188983);
  static const Color secondaryColor = Color(0xFF1A6484);
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color textColor = Color(0xFF373636);
  static const Color subtextColor = Color(0xFF777777);
  static const Color cardColor = Color(0xFFE5E5E5);
  static const Color hintColor = Color(0xFF9C9C9C);
  static const Color iconMaskColor = Color(0xffA2A2A2);
  static const Color iconColor = Color(0xFFE5E5E5);
  static const Color overlayColor = Color(0xFFC9C9C9);
  static const Color classCarColor = Color(0xFF34B8DC);
  static const Color classCarColor1 = Color(0xFF3AC7BA);
  static const Color classesBorderColor = Color(0xFF34B8DCCC);
  static const Color classesBorderColor1 = Color(0xFF3AC7BACC);
  static const Color LogoSecondary = Color(0xFF5EBEB2);
  static const Color Errorcolor = Color(0xFFB85B5B);
  static const Color IconsColor = Colors.black;
}

class AppColorsDarkTheme {
  // Dark Theme colors
  static const Color primaryColor = Color(0xff3AC7BA);
  static const Color secondaryColor = Color(0xFF34B8DC);
  static const Color backgroundColor = Color(0xFF202122);
  static const Color textColor = Color(0xFFF0ECEC);
  static const Color subtextColor = Color(0xFFAAA6A6);
  static const Color cardColor = Color(0xFF2F2E2E);
  static const Color hintColor = Color(0xFF545556);
  static const Color iconMaskColor = Color(0xff545556);
  static const Color iconColor = Color(0xFFFAFAFA);
  static const Color overlayColor = Color(0xFF4B4B4B);
  static const Color classCarColor = Color(0xFF34B8DC66);
  static const Color classCarColor1 = Color(0xFF3AC7BA66);
  static const Color classesBorderColor = Color(0xFF34B8DC99);
  static const Color classesBorderColor1 = Color(0xFF3AC7BA66);
  static const Color LogoSecondary = Color(0xFF5EBEB2);
  static const Color Errorcolor = Color(0xFFD15555);
  static const Color IconsColor = Colors.white;
}
