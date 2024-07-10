import 'package:flutter/material.dart';
import 'package:jwt_auth/provider.dart';
import 'package:jwt_auth/warpper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => jwtauth_provider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JWT APP',
      theme: ThemeData(useMaterial3: true),
      home: Wrapper(),
    );
  }
}
