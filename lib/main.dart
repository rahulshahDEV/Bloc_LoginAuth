import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_auth/bloc/auth/login_bloc.dart';
import 'package:jwt_auth/pages/warpper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'JWT APP',
        theme: ThemeData(useMaterial3: true),
        home: const Wrapper(),
      ),
    );
  }
}
