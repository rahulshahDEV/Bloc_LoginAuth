import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Controller {
  static const storage = FlutterSecureStorage();

  static Future<void> storeToken(String token) async {
    try {
      await storage.write(key: 'jwt_token', value: token);
    } on MissingPluginException {
      print('platform error !');
    }
  }

  static Future<void> deleteToken() async {
    try {
      await storage.delete(key: 'jwt_token');
      print('deleted');
    } catch (e) {
      print(e);
    }
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'jwt_token');
  }

  static Future<void> login({String? email, String? password}) async {
    var reqbody = {"email": email, "password": password};
    print(reqbody);
    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2:56720/login/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqbody),
      );

      if (response.statusCode == 202) {
        final String getToken = jsonDecode(response.body)['token']['access'];
        storeToken(getToken);
        var restok = getToken;
      } else {
        print('logged in but status failed');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> signUp(
      {String? email, String? password, String? username}) async {
    var reqbody = {"username": username, "email": email, "password": password};
    print(reqbody);

    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2:56720/register/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqbody),
      );

      if (response.statusCode == 200) {
        var jsonRes = jsonDecode(response.body);
        print('Sign up successful: $jsonRes');
      } else {
        print('Failed to sign up. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error during sign up: $e');
    }
  }
}
