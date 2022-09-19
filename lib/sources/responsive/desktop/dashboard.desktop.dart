import 'package:flutter/material.dart';
import 'package:password_manager/sources/widgets/dashboard_drawer.widget.dart';

import '../../widgets/snackbar/warning_snackbar.dart';

class DashboardDesktop extends StatefulWidget {
  const DashboardDesktop({super.key});

  @override
  State<DashboardDesktop> createState() => _DashboardDesktopState();
}

class _DashboardDesktopState extends State<DashboardDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          DashboardDrawer(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          warningSnackBar(context, "Work in progress");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
