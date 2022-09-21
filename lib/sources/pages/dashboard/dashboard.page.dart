import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:password_manager/sources/pages/dashboard/responsive/dashboard.desktop.dart';
import 'package:password_manager/sources/pages/dashboard/responsive/dashboard.mobile.dart';
import 'package:password_manager/sources/responsive/responsive_layout.dart';

import 'responsive/dasboard.tablet.dart';

class DashboardPage extends HookConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ResponsiveLayout(
      mobileBody: DashboardMobile(),
      tabletBody: DashboardTablet(),
      desktopBody: DashboardDesktop(),
    );
  }
}
