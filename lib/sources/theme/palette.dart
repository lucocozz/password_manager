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
  });
}

// https://maketintsandshades.com
class Palette {
  static const Color cherry = Color(0xffd42a78);
  static const Color purpleHeart = Color(0xff562ad4);
  static const Color pelorous = Color(0xff2AB0C2);
  static const Color malachite = Color(0xff24BE33);
  static const Color goldenGrass = Color(0xffD4AF2A);
  static const Color punch = Color(0xffD43E2A);

  static final dark = PaletteTheme(
    primary: const Color(0xff383C43),
    primaryShade: const Color(0xff282d34),
    primaryAccent: const Color(0xff6a6d72),
    onPrimary: Colors.white,
    secondary: cherry,
    onSecondary: Colors.white,
    background: const Color(0xff282D34),
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: const Color(0xff383C43),
    onSurface: Colors.white,
    primaryTextColor: Colors.white,
    inputColor: const Color(0xff151922),
    iconColor: Colors.white70,
    unfocusIconColor: const Color(0xff6a6d72),
    baseStrengthIndicator: Colors.white,
  );

  static final light = PaletteTheme(
    primary: const Color(0xffEBEFF5),
    primaryShade: Colors.white,
    primaryAccent: const Color(0xffCED5DF),
    onPrimary: Colors.black87,
    secondary: cherry,
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
  );
}
