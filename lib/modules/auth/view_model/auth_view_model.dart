import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/modules/auth/model/user_model.dart';
import 'package:wallpaper_app/modules/auth/service/auth_service.dart';
import 'package:wallpaper_app/modules/auth/service/user_database_service.dart';

class AuthViewModel extends ChangeNotifier {
  bool isLoading = false;
  User? _user;

  final _service = AuthService();
  final userService = UserDatabaseService();

  bool get isAuthenticated => _user != null;

  void loginWithGoogleClickEvent() async {
    isLoading = true;
    notifyListeners();
    _user = await _service.signInWithGoogle();

    if (_user != null) {
      final userModel = await userService.createUser(
        UserModel.fromFirebaseUser(_user!),
      );
      log('Login success: ${userModel!.userName ?? 'user'}');
    }

    isLoading = false;
    notifyListeners();
  }

  void getUser() async {
    log('Get user call');
    _user = _service.getUser();
    notifyListeners();
    log('User: $_user');
  }

  void logOutClickEvent() async {
    await _service.logOutUser();
    _user = null;
    notifyListeners();
  }
}
