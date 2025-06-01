import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/modules/auth/service/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  User? _user;

  final _service = AuthService();

  bool get isAuthenticated => _user != null;

  void loginWithGoogleClickEvent() async {
    isLoading = true;
    notifyListeners();
    _user = await _service.signInWithGoogle();
    log('Login success: $_user');
    isLoading = false;
    notifyListeners();
  }

  void getUser() async {
    log('Get user call');
    _user = await _service.getUser();
    notifyListeners();
    log('User: $_user');
  }

  void logOutClickEvent() async {
    await _service.logOutUser();
    _user = null;
    notifyListeners();
  }
}
