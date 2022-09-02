import 'package:flutter/material.dart';

class DrawerListTile extends StatefulWidget {
  final String? title;
  final IconData? leading;
  final void Function()? onTap;

  const DrawerListTile({
    Key? key,
    this.title,
    this.leading,
    this.onTap,
  }) : super(key: key);

  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.leading),
      title: Text(widget.title!),
      onTap: widget.onTap,
    );
  }
}
