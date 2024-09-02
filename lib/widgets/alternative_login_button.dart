import 'package:flutter/material.dart';

Widget AlternativeButton({IconData? icon, String? text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon),
        label: Text(text!),
        style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            backgroundColor:
                WidgetStateProperty.all<Color>(Colors.teal.shade400),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )))),
  );
}
