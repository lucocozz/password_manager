import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager/sources/routes/guards/is_sign_up.guard.dart';
import 'package:password_manager/sources/routes/router.gr.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'sources/theme/theme.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter(isSignUp: IsSignUp());

  void _buildUuid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("uuid") == false) {
      prefs.setString("uuid", const Uuid().v4());
    }
  }

  @override
  Widget build(BuildContext context) {
    _buildUuid();

    return AdaptiveTheme(
      light: AppTheme.lightTheme(),
      dark: AppTheme.darkTheme(),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp.router(
        builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
          ],
        ),
        theme: theme,
        darkTheme: darkTheme,
        title: "Password Manager",
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
