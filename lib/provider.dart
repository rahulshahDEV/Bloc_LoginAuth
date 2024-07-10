import 'package:flutter/material.dart';

class jwtauth_provider extends ChangeNotifier {
  bool _isPasswordVisible = true;
  bool get isVisible => _isPasswordVisible;
  void visibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}
