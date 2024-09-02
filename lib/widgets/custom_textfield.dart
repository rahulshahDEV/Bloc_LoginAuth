import 'package:flutter/material.dart';

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
  bool _isPWDvisible = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextFormField(
          controller: widget.controller,
          obscureText: widget.suffixIconExist && _isPWDvisible,
          decoration: InputDecoration(
            label: Text(widget.label),
            suffixIcon: widget.suffixIconExist
                ? _isPWDvisible
                    ? IconButton(
                        icon: const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPWDvisible = !_isPWDvisible;
                          });
                        },
                      )
                    : IconButton(
                        icon: const Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            _isPWDvisible = !_isPWDvisible;
                          });
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
