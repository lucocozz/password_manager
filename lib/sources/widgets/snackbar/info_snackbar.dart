import 'package:flutter/material.dart';

void infoSnackBar(BuildContext context, String? message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        Container(
          width: 48,
          height: 48,
          color: Colors.lightBlue,
          child: const Icon(Icons.info_outline, color: Colors.black),
        ),
        const SizedBox(width: 8),
        Text(message!, style: const TextStyle(color: Colors.black)),
      ],
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.lightBlueAccent,
    behavior: SnackBarBehavior.floating,
    width: 280,
    padding: const EdgeInsets.all(0),
  ));
}
