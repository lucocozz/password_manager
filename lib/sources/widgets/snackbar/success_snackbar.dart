import 'package:flutter/material.dart';

void successSnackBar(BuildContext context, String? message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        Container(
          width: 48,
          height: 48,
          color: Colors.green,
          child: const Icon(Icons.check, color: Colors.black),
        ),
        const SizedBox(width: 8),
        Text(message!, style: const TextStyle(color: Colors.black)),
      ],
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.lightGreen,
    behavior: SnackBarBehavior.floating,
    width: 280,
    padding: const EdgeInsets.all(0),
  ));
}
