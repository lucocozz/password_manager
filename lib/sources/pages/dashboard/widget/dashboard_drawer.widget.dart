import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:password_manager/main.dart';
import 'package:password_manager/sources/custom_icons.dart';
import 'package:password_manager/sources/widgets/popup_menu_list_tile.widget.dart';

import '../../../widgets/snackbar/warning_snackbar.dart';
import '../../../widgets/drawer_list_tile.dart';
import '../../../models/drawer_list_tile.model.dart';

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({super.key});

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  int selected = 0;
  static final List<DrawerListTileModal> vault = [
    DrawerListTileModal(
      title: 'Passwords',
      icon: const Icon(Icons.vpn_key_rounded),
    ),
    DrawerListTileModal(
      title: 'Secure Notes',
      icon: const Icon(Icons.description_rounded),
    ),
    DrawerListTileModal(
      title: 'Identities',
      icon: const Icon(Icons.person_rounded),
    ),
    DrawerListTileModal(
      title: 'Credit Cards',
      icon: const Icon(Icons.credit_card_rounded),
    ),
  ];
  static final List<DrawerListTileModal> tools = [
    DrawerListTileModal(
      title: 'Password Generator',
      icon: const Icon(FontAwesomeIcons.arrowsRotate, size: 20),
    ),
    DrawerListTileModal(
      title: 'Password Health',
      icon: const Icon(CustomIcons.lifeline),
    ),
    DrawerListTileModal(
      title: 'Scan Leaks',
      icon: const Icon(Icons.track_changes_rounded),
    ),
  ];

  List<DrawerListTileModal> labels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                    PopupMenuButton(
                      splashRadius: 20,
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                            value: 1,
                            child: PopupMenuListTile(
                              leading: Icon(
                                FontAwesomeIcons.fileImport,
                                size: 20,
                              ),
                              title: "Import",
                            ),
                          ),
                          const PopupMenuItem(
                            value: 2,
                            child: PopupMenuListTile(
                              leading: Icon(
                                FontAwesomeIcons.fileExport,
                                size: 20,
                              ),
                              title: "Export",
                            ),
                          ),
                        ];
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings_rounded),
                      splashRadius: 20,
                      tooltip: "Settings",
                      onPressed: () {
                        warningSnackBar(context, "Work in progress");
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              DrawerListTile(
                title: 'All Items',
                leading: const Icon(Icons.category_rounded),
                selected: selected == 0,
                onTap: () {
                  setState(() {
                    selected = 0;
                  });
                  warningSnackBar(context, "Work in progress");
                },
              ),
              DrawerListTile(
                title: 'Favorites',
                leading: const Icon(Icons.star_rounded),
                selected: selected == 1,
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                  warningSnackBar(context, "Work in progress");
                },
              ),
              const SizedBox(height: 5),
              const Divider(),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  title: const Text("Vault"),
                  maintainState: true,
                  initiallyExpanded: true,
                  children: [
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: vault.length,
                        itemBuilder: (context, index) {
                          return DrawerListTile(
                            title: vault[index].title,
                            leading: vault[index].icon,
                            selected: selected - 3 == index,
                            onTap: () {
                              setState(() {
                                selected = index + 3;
                              });
                              // vault[index].onTap!() ??
                              warningSnackBar(context, "Work in progress");
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Divider(),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  title: const Text("Labels"),
                  maintainState: true,
                  initiallyExpanded: true,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: labels.length,
                      itemBuilder: (context, index) {
                        return DrawerListTile(
                          title: labels[index].title,
                          leading: labels[index].icon,
                          selected: selected - 3 - vault.length == index,
                          onTap: () {
                            setState(() {
                              selected = index + 3 + vault.length;
                            });
                            // labels[index].onTap!() ??
                            warningSnackBar(context, "Work in progress");
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 5),
              const Divider(),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  title: const Text('Tools'),
                  maintainState: true,
                  initiallyExpanded: true,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tools.length,
                      itemBuilder: (context, index) {
                        return DrawerListTile(
                          title: tools[index].title,
                          leading: tools[index].icon,
                          selected:
                              selected - 3 - vault.length - labels.length ==
                                  index,
                          onTap: () {
                            setState(() {
                              selected =
                                  index + 3 + vault.length + labels.length;
                            });
                            // tools[index].onTap!()
                            warningSnackBar(context, "Work in progress");
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Divider(),
              DrawerListTile(
                title: 'Deleted Items',
                leading: const Icon(Icons.delete),
                selected: selected == 2,
                onTap: () {
                  setState(() {
                    selected = 2;
                  });
                  warningSnackBar(context, "Work in progress");
                },
              ),
              const SizedBox(height: 10),
              Text(
                kVersion,
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
          )
        ],
      ),
    );
  }
}
