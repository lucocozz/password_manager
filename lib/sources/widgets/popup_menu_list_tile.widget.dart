import 'package:flutter/material.dart';

class PopupMenuListTile extends StatelessWidget {
  final Icon? leading;
  final String? title;
  final Function()? onTap;

  const PopupMenuListTile({
    Key? key,
    this.leading,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: leading,
      title: Text(
        title!,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      onTap: onTap,
    );
  }
}
