import 'package:flutter/material.dart';
import 'package:password_manager/sources/widgets/dashboard_drawer.widget.dart';
import 'package:password_manager/sources/widgets/wip_snackbar.dart';

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
          wipSnackBar(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
