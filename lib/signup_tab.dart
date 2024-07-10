import 'package:flutter/material.dart';
import 'package:jwt_auth/button.dart';
import 'package:jwt_auth/controller.dart';
import 'package:jwt_auth/custom_textfield.dart';
import 'package:jwt_auth/textwidget.dart';

Widget signup_tab() {
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  return Column(
    children: [
      textWidget(text: 'Create An Account'),
      CustomTextField(
        prefixIcon: Icons.person,
        label: 'Username',
        controller: _fullname,
      ),
      CustomTextField(
        prefixIcon: Icons.email,
        label: 'Email',
        controller: _email,
      ),
      CustomTextField(
        prefixIcon: Icons.lock,
        label: 'Password',
        suffixIconExist: true,
        controller: _password,
      ),
      Button(
        label: 'Register',
        function: () {
          Controller.signUp(
              email: _email.text,
              password: _password.text,
              username: _fullname.text);
        },
        radius: 20,
      ),
    ],
  );
}
