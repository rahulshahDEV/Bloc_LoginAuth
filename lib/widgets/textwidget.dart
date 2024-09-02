import 'package:flutter/material.dart';

Widget textWidget({String? text, double fontsize = 25, Color? colour}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Text(
      text!,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontsize,
          color: colour != null ? colour : Colors.teal.shade400),
    ),
  );
}
