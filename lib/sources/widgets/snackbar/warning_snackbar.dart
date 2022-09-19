import 'package:flutter/material.dart';

void warningSnackBar(BuildContext context, String? message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        Container(
          width: 48,
          height: 48,
          color: Colors.amber,
          child: const Icon(Icons.warning_amber_rounded, color: Colors.black),
        ),
        const SizedBox(width: 8),
        Text(message!, style: const TextStyle(color: Colors.black)),
      ],
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.amberAccent,
    behavior: SnackBarBehavior.floating,
    width: 280,
    padding: const EdgeInsets.all(0),
  ));
}
