import 'package:flutter/material.dart';
import 'package:jwt_auth/controller.dart';
import 'package:jwt_auth/homescreen.dart';
import 'package:jwt_auth/onboarding_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Controller.getToken(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return const HomeScreen();
        } else {
          return const OnboardingPage(); // Or a loading indicator while fetching
        }
      },
    );
  }
}
