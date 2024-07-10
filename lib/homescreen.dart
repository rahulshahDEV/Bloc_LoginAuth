import 'package:flutter/material.dart';
import 'package:jwt_auth/controller.dart';
import 'package:jwt_auth/textwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
            onPressed: () {
              Controller.deleteToken();
              setState(() {});
            },
            child: Text('logout')),
      ),
      body: Center(
        child: textWidget(text: 'HOMEPAGE'),
      ),
    );
  }
}
