import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_auth/bloc/auth/login_bloc.dart';
import 'package:jwt_auth/bloc/auth/login_state.dart';
import 'package:jwt_auth/widgets/alternative_login_button.dart';
import 'package:jwt_auth/widgets/curve_container.dart';
import 'package:jwt_auth/widgets/divider.dart';
import 'package:jwt_auth/widgets/login_tab.dart';
import 'package:jwt_auth/widgets/signup_tab.dart';
import 'package:jwt_auth/widgets/textwidget.dart';
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
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginInitial) {
              return SingleChildScrollView(
                child: Column(
                  children: [
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
                                bottom:
                                    BorderSide(color: Colors.white, width: 3))),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child:
                            TabBarView(children: [LoginTab(), signup_tab()])),
                    divider(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AlternativeButton(
                            icon: Icons.facebook, text: 'Facebook'),
                        AlternativeButton(icon: Icons.tiktok, text: 'TikTok'),
                      ],
                    )
                  ],
                ),
              );
            } else if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoginError) {
              const Center(
                child: Text('Error'),
              );
            } else {
              return const SizedBox();
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
