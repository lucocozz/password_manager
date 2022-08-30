import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'sources/theme/theme.dart';
import 'sources/pages/create_master_password.dart';
import 'sources/pages/unlock.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<bool> _isMasterPasswordCreated() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getBool('isMasterPasswordCreated') ?? false);
  }

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
      builder: (theme, darkTheme) => MaterialApp(
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
        home: FutureBuilder<bool>(
          future: _isMasterPasswordCreated(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!
                  ? const UnlockPage()
                  : const CreateMasterPasswordPage();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
