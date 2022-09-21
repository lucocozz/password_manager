import 'package:flutter/material.dart';

class DrawerListTileModal {
  final String title;
  final Icon icon;
  final Function()? onTap;

  DrawerListTileModal({
    required this.title,
    required this.icon,
    this.onTap,
  });
}
