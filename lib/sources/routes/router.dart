import 'package:auto_route/auto_route.dart';

import '../pages/dashboard/dashboard.page.dart';
import '../pages/sign_up/sign_up.page.dart';
import '../pages/sign_in.page.dart';
import 'guards/is_sign_up.guard.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route",
  routes: [
    AutoRoute(
        name: "SignUpRouter",
        path: "/sign_up",
        page: SignUpPage,
        initial: true,
        guards: [IsSignUp]),
    AutoRoute(
      name: "SignInRouter",
      path: "/sign_in",
      page: SignInPage,
    ),
    AutoRoute(
      name: "DashboardRouter",
      path: "/dashboard",
      page: DashboardPage,
    ),
  ],
)
class $AppRouter {}
