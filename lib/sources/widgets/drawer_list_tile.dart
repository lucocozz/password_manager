import 'package:flutter/material.dart';

class DrawerListTile extends StatefulWidget {
  final String? title;
  final Icon? leading;
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
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: selected,
          child: Container(
            width: 4,
            height: 40,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        ListTile(
          selected: selected,
          leading: widget.leading,
          title: Text(widget.title!, style: const TextStyle(fontSize: 16)),
          onTap: () {
            // widget.onTap;
            setState(() => selected = !selected);
          },
        ),
      ],
    );
  }
}
