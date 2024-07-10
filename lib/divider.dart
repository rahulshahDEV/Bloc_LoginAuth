import 'package:flutter/material.dart';
import 'package:jwt_auth/textwidget.dart';

Widget divider(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          color: Colors.grey,
          height: 2,
          width: MediaQuery.of(context).size.width * 0.125,
        ),
        textWidget(text: 'or sign up with'),
        Container(
          color: Colors.grey,
          height: 2,
          width: MediaQuery.of(context).size.width * 0.125,
        ),
      ],
    ),
  );
}
