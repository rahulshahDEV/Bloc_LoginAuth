import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jwt_auth/provider.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.prefixIcon,
      required this.controller,
      required this.label,
      this.suffixIconExist = false});

  final IconData prefixIcon;
  final String label;
  final bool suffixIconExist;
  final TextEditingController controller;

  final OutlineInputBorder _borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.teal.shade400));

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final bool _isPasswordVisible = context.watch<jwtauth_provider>().isVisible;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextFormField(
          controller: widget.controller,
          obscureText: widget.suffixIconExist && _isPasswordVisible,
          decoration: InputDecoration(
            label: Text(widget.label),
            suffixIcon: widget.suffixIconExist
                ? _isPasswordVisible
                    ? IconButton(
                        icon: const Icon(Icons.visibility_off),
                        onPressed: () {
                          context.read<jwtauth_provider>().visibility();
                        },
                      )
                    : IconButton(
                        icon: const Icon(Icons.remove_red_eye),
                        onPressed: () {
                          context.read<jwtauth_provider>().visibility();
                        },
                      )
                : null,
            prefixIcon: Icon(
              widget.prefixIcon,
              color: Colors.teal.shade400,
            ),
            focusedBorder: widget._borderStyle,
            enabledBorder: widget._borderStyle,
            border: widget._borderStyle,
          )),
    );
  }
}
