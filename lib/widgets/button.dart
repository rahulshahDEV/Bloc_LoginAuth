import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      this.icon,
      required this.label,
      this.radius = 0,
      required this.function});

  final IconData? icon;
  final String label;
  final VoidCallback function;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
          onPressed: function,
          label: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          icon: icon != null
              ? Icon(
                  icon,
                  size: 40,
                )
              : null,
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  WidgetStateProperty.all<Color>(Colors.teal.shade400),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              )))),
    );
  }
}
