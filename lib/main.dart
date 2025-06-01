import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/application.dart';
import 'package:wallpaper_app/core/env_service.dart';
import 'package:wallpaper_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EnvService.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Application());
}

// Start at 1:21:00
