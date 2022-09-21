// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/dashboard/dashboard.page.dart' as _i3;
import '../pages/sign_in.page.dart' as _i2;
import '../pages/sign_up/sign_up.page.dart' as _i1;
import 'guards/is_sign_up.guard.dart' as _i6;

class AppRouter extends _i4.RootStackRouter {
  AppRouter(
      {_i5.GlobalKey<_i5.NavigatorState>? navigatorKey, required this.isSignUp})
      : super(navigatorKey);

  final _i6.IsSignUp isSignUp;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SignUpRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SignUpPage());
    },
    SignInRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    DashboardRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.DashboardPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '/sign_up', fullMatch: true),
        _i4.RouteConfig(SignUpRouter.name,
            path: '/sign_up', guards: [isSignUp]),
        _i4.RouteConfig(SignInRouter.name, path: '/sign_in'),
        _i4.RouteConfig(DashboardRouter.name, path: '/dashboard')
      ];
}

/// generated route for
/// [_i1.SignUpPage]
class SignUpRouter extends _i4.PageRouteInfo<void> {
  const SignUpRouter() : super(SignUpRouter.name, path: '/sign_up');

  static const String name = 'SignUpRouter';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRouter extends _i4.PageRouteInfo<void> {
  const SignInRouter() : super(SignInRouter.name, path: '/sign_in');

  static const String name = 'SignInRouter';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRouter extends _i4.PageRouteInfo<void> {
  const DashboardRouter() : super(DashboardRouter.name, path: '/dashboard');

  static const String name = 'DashboardRouter';
}
