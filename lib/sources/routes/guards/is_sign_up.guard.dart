import 'package:auto_route/auto_route.dart';
import 'package:password_manager/sources/routes/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsSignUp extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isSignUp') ?? false) {
      router.push(const SignInRouter());
    } else {
      resolver.next(true);
    }
  }
}
