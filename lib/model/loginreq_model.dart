// To parse this JSON data, do
//
//     final loginreqModel = loginreqModelFromJson(jsonString);

import 'dart:convert';

LoginreqModel loginreqModelFromJson(String str) =>
    LoginreqModel.fromJson(json.decode(str));

String loginreqModelToJson(LoginreqModel data) => json.encode(data.toJson());

class LoginreqModel {
  String? username;
  String? password;

  LoginreqModel({
    this.username,
    this.password,
  });

  factory LoginreqModel.fromJson(Map<String, dynamic> json) => LoginreqModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
