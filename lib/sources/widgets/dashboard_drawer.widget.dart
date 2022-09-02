import 'package:flutter/material.dart';

import 'drawer_list_tile.dart';

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({super.key});

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 256,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  splashRadius: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                  splashRadius: 20,
                )
              ],
            ),
          ),
          // const SizedBox(height: 14),
          DrawerListTile(
            title: 'All Items',
            leading: Icons.list_rounded,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
