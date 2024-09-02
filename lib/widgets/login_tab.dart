import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_auth/bloc/auth/login_bloc.dart';
import 'package:jwt_auth/bloc/auth/login_event.dart';
import 'package:jwt_auth/model/loginreq_model.dart';
import 'package:jwt_auth/widgets/button.dart';
import 'package:jwt_auth/widgets/custom_textfield.dart';
import 'package:jwt_auth/widgets/textwidget.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
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
            context.read<LoginBloc>().add(LoginReqEvent(
                loginreqModel: LoginreqModel(
                    password: _password.text, username: _email.text)));
            // Controller.login(email: _email.text, password: _password.text);
            // BlocProvider.of<LoginBloc>(context).add(LoginReqEvent(
            //     loginreqModel: LoginreqModel(
            //         password: _password.text, username: _email.text)));
          },
          radius: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
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
                      text: 'Forgot Password ?',
                      fontsize: 12,
                      colour: Colors.red))
            ],
          ),
        )
      ],
    );
  }
}
