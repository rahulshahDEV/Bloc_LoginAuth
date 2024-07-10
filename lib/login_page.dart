import 'package:flutter/material.dart';
import 'package:jwt_auth/alternative_login_button.dart';
import 'package:jwt_auth/curve_container.dart';
import 'package:jwt_auth/divider.dart';
import 'package:jwt_auth/login_tab.dart';
import 'package:jwt_auth/signup_tab.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Login'),
    Tab(text: 'SignUp'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        bottomNavigationBar: const RotatedBox(
            quarterTurns: 2,
            child: CurveContainer(
              height: 0.1,
            )),
        body: SingleChildScrollView(
          child: Column(children: [
            const CurveContainer(
              goBack: true,
              height: 0.22,
              tab: TabBar(
                tabs: myTabs,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 3))),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: TabBarView(children: [loginTab(), signup_tab()])),
            divider(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AlternativeButton(icon: Icons.facebook, text: 'Facebook'),
                AlternativeButton(icon: Icons.tiktok, text: 'TikTok'),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
