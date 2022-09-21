import 'package:flutter/material.dart';

class PaletteTheme {
  final Color primary;
  final Color onPrimary;
  final Color primaryShade;
  final Color primaryAccent;
  final Color secondary;
  final Color onSecondary;
  final Color background;
  final Color onBackground;
  final Color error;
  final Color onError;
  final Color surface;
  final Color onSurface;
  final Color primaryTextColor;
  final Color inputColor;
  final Color iconColor;
  final Color unfocusIconColor;
  final Color baseStrengthIndicator;
  final Color unselectedTextColor;
  final Color selectedTileColor;
  final Color expensionTileColor;

  PaletteTheme({
    required this.primary,
    required this.onPrimary,
    required this.primaryShade,
    required this.primaryAccent,
    required this.secondary,
    required this.onSecondary,
    required this.background,
    required this.onBackground,
    required this.error,
    required this.onError,
    required this.surface,
    required this.onSurface,
    required this.primaryTextColor,
    required this.inputColor,
    required this.iconColor,
    required this.unfocusIconColor,
    required this.baseStrengthIndicator,
    required this.unselectedTextColor,
    required this.selectedTileColor,
    required this.expensionTileColor,
  });
}

// https://maketintsandshades.com
class Palette {
  // secondary palette https://coolors.co/d99f00-d24503-d91b74-6714da-0084ff-3fbd15
  static const Color goldenRod = Color(0xffD99F00);
  static const Color sinopia = Color(0xffD24503);
  static const Color redPurple = Color(0xffD91B74);
  static const Color hanPurple = Color(0xff6714DA);
  static const Color azure = Color(0xff0084FF);
  static const Color kellyGreen = Color(0xff3FBD15);

  // dark palette https://coolors.co/101219-1f2533-333946-464b57
  static const Color richBlackForga29 = Color(0xff101219);
  static const Color raisinBlack = Color(0xff1F2533);
  static const Color gunmetal = Color(0xff333946);
  static const Color charcoal = Color(0xff464B57);

  static final dark = PaletteTheme(
    primary: gunmetal,
    primaryShade: raisinBlack,
    primaryAccent: charcoal,
    onPrimary: Colors.white,
    secondary: redPurple,
    onSecondary: Colors.white,
    background: raisinBlack,
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: gunmetal,
    onSurface: Colors.white,
    primaryTextColor: Colors.white,
    inputColor: richBlackForga29,
    iconColor: Colors.white70,
    unfocusIconColor: charcoal,
    baseStrengthIndicator: Colors.white,
    unselectedTextColor: Colors.white70,
    selectedTileColor: Colors.white12,
    expensionTileColor: Colors.white54,
  );

  static final light = PaletteTheme(
    primary: const Color(0xffEBEFF5),
    primaryShade: Colors.white,
    primaryAccent: const Color(0xffCED5DF),
    onPrimary: Colors.black87,
    secondary: redPurple,
    onSecondary: Colors.white,
    background: Colors.white,
    onBackground: Colors.black87,
    error: Colors.red,
    onError: Colors.white,
    surface: const Color(0xffEBEFF5),
    onSurface: Colors.black87,
    primaryTextColor: Colors.black87,
    inputColor: const Color(0xffEBEFF5),
    iconColor: Colors.black87,
    unfocusIconColor: const Color(0xffCED5DF),
    baseStrengthIndicator: const Color(0xffC6CDD9),
    unselectedTextColor: Colors.black87,
    selectedTileColor: Colors.black12,
    expensionTileColor: Colors.black38,
  );
}
