import 'package:flutter/material.dart';
import 'package:jwt_auth/button.dart';
import 'package:jwt_auth/controller.dart';
import 'package:jwt_auth/custom_textfield.dart';
import 'package:jwt_auth/textwidget.dart';

Widget loginTab() {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  return Column(
    children: [
      textWidget(text: 'welcome Back !'),
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
        label: 'Login',
        function: () {
          Controller.login(email: _email.text, password: _password.text);
        },
        radius: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Transform.scale(
                scale: 0.8,
                child: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              textWidget(
                text: 'Remember Password',
                fontsize: 12,
              )
            ],
          ),
          TextButton(
              onPressed: () {},
              child: textWidget(
                  text: 'Forgot Password ?', fontsize: 12, colour: Colors.red))
        ],
      )
    ],
  );
}
