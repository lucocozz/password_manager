import 'package:flutter/material.dart';
import 'package:password_manager/sources/custom_icons.dart';

import '../widgets/snackbar/warning_snackbar.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        warningSnackBar(context, "Work in progress");
                      },
                      icon: const Icon(Icons.more_vert),
                      splashRadius: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        warningSnackBar(context, "Work in progress");
                      },
                      icon: const Icon(Icons.settings),
                      splashRadius: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              DrawerListTile(
                title: 'All Items',
                leading: const Icon(Icons.list_rounded),
                onTap: () {
                  warningSnackBar(context, "Work in progress");
                },
              ),
              DrawerListTile(
                title: 'Favorites',
                leading: const Icon(Icons.star_rounded),
                onTap: () {
                  warningSnackBar(context, "Work in progress");
                },
              ),
              const SizedBox(height: 5),
              const Divider(),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: const Text("Vault"),
                  maintainState: true,
                  initiallyExpanded: true,
                  children: [
                    DrawerListTile(
                      title: 'Passwords',
                      leading: const Icon(CustomIcons.password),
                      onTap: () {
                        warningSnackBar(context, "Work in progress");
                      },
                    ),
                    DrawerListTile(
                      title: 'Secure Notes',
                      leading: const Icon(Icons.description_rounded),
                      onTap: () {
                        warningSnackBar(context, "Work in progress");
                      },
                    ),
                    DrawerListTile(
                      title: 'Identities',
                      leading: const Icon(Icons.person_rounded),
                      onTap: () {
                        warningSnackBar(context, "Work in progress");
                      },
                    ),
                    DrawerListTile(
                      title: 'Credit Cards',
                      leading: const Icon(Icons.credit_card_rounded),
                      onTap: () {
                        warningSnackBar(context, "Work in progress");
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Divider(),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: const ExpansionTile(
                  title: Text("Labels"),
                  maintainState: true,
                  initiallyExpanded: true,
                  children: [],
                ),
              ),
            ],
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 5),
              const Divider(),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  title: const Text('Tools'),
                  children: [
                    DrawerListTile(
                      title: 'Password Generator',
                      leading: const Icon(Icons.vpn_key_rounded),
                      onTap: () {
                        warningSnackBar(context, "Work in progress");
                      },
                    ),
                    DrawerListTile(
                      title: 'Password Health',
                      leading: const Icon(Icons.qr_code_rounded),
                      onTap: () {
                        warningSnackBar(context, "Work in progress");
                      },
                    ),
                    DrawerListTile(
                      title: 'Scan leaks',
                      leading: const Icon(Icons.track_changes_rounded),
                      onTap: () {
                        warningSnackBar(context, "Work in progress");
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Divider(),
              DrawerListTile(
                title: 'Deleted Items',
                leading: const Icon(Icons.delete_rounded),
                onTap: () {
                  warningSnackBar(context, "Work in progress");
                },
              ),
              const SizedBox(height: 10),
              Text(
                "Version 0.0.0",
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .caption!
                          .color!
                          .withOpacity(0.5),
                    ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ],
      ),
    );
  }
}
