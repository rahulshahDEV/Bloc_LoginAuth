import 'dart:convert';
import 'package:jwt_auth/constant.dart';
import 'package:jwt_auth/model/loginreq_model.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_auth/model/loginres_model.dart';

class LoginRepo {
  Future<LoginModel> login(
      {required String username, required String password}) async {
    try {
      final LoginreqModel _loginReqModel =
          LoginreqModel(username: username, password: password);
      http.Response response = await http.post(Uri.parse(uri),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(_loginReqModel.toJson()));
      if (response.statusCode == 200) {
        var res = response.body;

        return LoginModel.fromJson(jsonDecode(res));
      } else {
        print('Status code error');
        return LoginModel();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
