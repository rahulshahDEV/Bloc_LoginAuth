import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_auth/bloc/auth/login_bloc.dart';
import 'package:jwt_auth/bloc/auth/login_state.dart';
import 'package:jwt_auth/pages/homescreen.dart';
import 'package:jwt_auth/pages/onboarding_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if ((state == LoginInitial)) {
          return OnboardingPage();
        } else if (state == LoginLoaded) {
          return HomeScreen();
        } else {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
          );
        }
      },
    );
    // return FutureBuilder(
    //   future: Controller.getToken(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData && snapshot.data!.isNotEmpty) {
    //       return const HomeScreen();
    //     } else {
    //       return const OnboardingPage(); // Or a loading indicator while fetching
    //     }
    //   },
    // );
  }
}
