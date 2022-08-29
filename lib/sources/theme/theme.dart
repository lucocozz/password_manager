import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'palette.dart';

class AppTheme {
  AppTheme._();

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Palette.dark.primary,
      primaryColorDark: Palette.dark.primaryAccent,
      primaryColorLight: Palette.dark.primaryShade,
      fontFamily: GoogleFonts.lato().fontFamily,
      colorScheme: _colorScheme(
        brightness: Brightness.dark,
        palette: Palette.dark,
      ),
      scaffoldBackgroundColor: Palette.dark.background,
      unselectedWidgetColor: Palette.dark.primaryAccent,
      toggleableActiveColor: Palette.dark.secondary,
      bottomSheetTheme: _bottoSheetTheme(palette: Palette.dark),
      checkboxTheme: _checkBoxTheme(palette: Palette.dark),
      drawerTheme: _drawerTheme(palette: Palette.dark),
      progressIndicatorTheme: _progressIndicatorTheme(palette: Palette.dark),
      textTheme: _textTheme(palette: Palette.dark),
      elevatedButtonTheme: _elevatedButtonTheme(palette: Palette.dark),
      inputDecorationTheme: _inputDecorationTheme(palette: Palette.dark),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Palette.light.primary,
      primaryColorDark: Palette.light.primaryAccent,
      primaryColorLight: Palette.light.primaryShade,
      fontFamily: GoogleFonts.lato().fontFamily,
      colorScheme: _colorScheme(
        brightness: Brightness.light,
        palette: Palette.light,
      ),
      scaffoldBackgroundColor: Palette.light.background,
      unselectedWidgetColor: Palette.light.primaryAccent,
      toggleableActiveColor: Palette.light.secondary,
      bottomSheetTheme: _bottoSheetTheme(palette: Palette.light),
      checkboxTheme: _checkBoxTheme(palette: Palette.light),
      drawerTheme: _drawerTheme(palette: Palette.light),
      progressIndicatorTheme: _progressIndicatorTheme(palette: Palette.light),
      textTheme: _textTheme(palette: Palette.light),
      elevatedButtonTheme: _elevatedButtonTheme(palette: Palette.light),
      inputDecorationTheme: _inputDecorationTheme(palette: Palette.light),
    );
  }

  static ColorScheme _colorScheme({
    required Brightness brightness,
    required PaletteTheme palette,
  }) {
    return ColorScheme(
      brightness: brightness,
      primary: palette.primary,
      onPrimary: palette.onPrimary,
      secondary: palette.secondary,
      onSecondary: palette.onSecondary,
      error: palette.error,
      onError: palette.onError,
      background: palette.background,
      onBackground: palette.onBackground,
      surface: palette.surface,
      onSurface: palette.onSurface,
    );
  }

  static BottomSheetThemeData _bottoSheetTheme({
    required PaletteTheme palette,
  }) {
    return BottomSheetThemeData(
      backgroundColor: palette.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
    );
  }

  static CheckboxThemeData _checkBoxTheme({required PaletteTheme palette}) {
    return CheckboxThemeData(
      checkColor: MaterialStateProperty.all(palette.onSecondary),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }

  static DrawerThemeData _drawerTheme({required PaletteTheme palette}) {
    return DrawerThemeData(backgroundColor: palette.primary);
  }

  static ProgressIndicatorThemeData _progressIndicatorTheme({
    required PaletteTheme palette,
  }) {
    return ProgressIndicatorThemeData(
      color: palette.primaryAccent,
    );
  }

  // font size guide: https://bit.ly/3CnTxJ8
  static TextTheme _textTheme({required PaletteTheme palette}) {
    return TextTheme(
      displayLarge: GoogleFonts.lato(color: palette.primaryTextColor),
      displayMedium: GoogleFonts.lato(color: palette.primaryTextColor),
      displaySmall: GoogleFonts.lato(color: palette.primaryTextColor),
      headlineLarge: GoogleFonts.lato(
        color: palette.primaryTextColor,
        fontSize: 32,
      ),
      headlineMedium: GoogleFonts.lato(color: palette.primaryTextColor),
      headlineSmall: GoogleFonts.lato(color: palette.primaryTextColor),
      titleLarge: GoogleFonts.lato(color: palette.primaryTextColor),
      titleMedium: GoogleFonts.lato(color: palette.primaryTextColor),
      titleSmall: GoogleFonts.lato(color: palette.primaryTextColor),
      labelLarge: GoogleFonts.lato(color: palette.primaryTextColor),
      labelMedium: GoogleFonts.lato(color: palette.primaryTextColor),
      labelSmall: GoogleFonts.lato(color: palette.primaryTextColor),
      bodyLarge: GoogleFonts.lato(color: palette.primaryTextColor),
      bodyMedium: GoogleFonts.lato(color: palette.primaryTextColor),
      bodySmall: GoogleFonts.lato(color: palette.primaryTextColor),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme({
    required PaletteTheme palette,
  }) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(palette.secondary),
        shadowColor: MaterialStateProperty.all<Color>(palette.secondary),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme({
    required PaletteTheme palette,
  }) {
    return InputDecorationTheme(
      fillColor: palette.inputColor,
      filled: true,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: palette.primaryAccent,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: palette.error.withOpacity(0.60),
        ),
      ),
      border: const OutlineInputBorder(),
      suffixIconColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return palette.iconColor;
        } else {
          return palette.unfocusIconColor;
        }
      }),
    );
  }
}
