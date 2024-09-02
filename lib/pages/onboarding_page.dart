import 'package:flutter/material.dart';
import 'package:jwt_auth/widgets/button.dart';
import 'package:jwt_auth/pages/login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image.asset(
            'assets/onboard.jpg',
            // height: 200,
            scale: 2,
          ),
          Button(
              radius: 5,
              icon: Icons.arrow_left_sharp,
              label: 'Swipe To Go ',
              function: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
              })
        ]),
      ),
    );
  }
}
