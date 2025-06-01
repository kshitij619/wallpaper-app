import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/modules/auth/view/auth_guard.dart';
import 'package:wallpaper_app/modules/auth/view_model/auth_view_model.dart';
import 'package:wallpaper_app/modules/home/view_model/home_view_model.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: MaterialApp(
        home: const AuthGuard(),
      ),
    );
  }
}
