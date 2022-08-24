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
      primaryTextTheme: _primaryTextTheme(palette: Palette.dark),
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
      primaryTextTheme: _primaryTextTheme(palette: Palette.light),
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

  static TextTheme _primaryTextTheme({required PaletteTheme palette}) {
    return const TextTheme().apply(
      displayColor: palette.secondary,
      bodyColor: palette.secondary,
    );
  }
}
