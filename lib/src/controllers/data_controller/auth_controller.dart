import 'package:flutter/material.dart';
import 'package:model/model.dart';

import '../../utils/exports.dart';

class AuthController extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _signUpInProgress = false;
  bool _loginInProgress = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get signUpInProgress => _signUpInProgress;
  bool get loginInProgress => _loginInProgress;

  void checkAuth() {
    var tokenString = LocalRepository.getToken();
    if (tokenString != null) {
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }
    notifyListeners();
  }

  Future<bool> signUp(
    String name,
    String username,
    String password,
    GenderType gender,
  ) async {
    _signUpInProgress = true;
    notifyListeners();
    final getToken = await AuthRepository.signup(
      name: name,
      userName: username,
      password: password,
      confirmPassword: password,
      gender: gender,
    );
    if (getToken != null) {
      LocalRepository.writeToken(getToken);
      checkAuth();
      _signUpInProgress = false;
      notifyListeners();
      return true;
    }
    _signUpInProgress = false;
    notifyListeners();
    return false;
  }

  Future<bool> login(String username, String password) async {
    _loginInProgress = true;
    notifyListeners();
    final getToken = await AuthRepository.signIn(
      userName: username,
      password: password,
    );
    if (getToken != null) {
      LocalRepository.writeToken(getToken);
      checkAuth();
      _loginInProgress = false;
      notifyListeners();
      return true;
    }
    _loginInProgress = false;
    notifyListeners();
    return false;
  }

  void logOut() {
    LocalRepository.ereas();
    checkAuth();
  }
}
