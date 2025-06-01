import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/modules/auth/view_model/auth_view_model.dart';
import 'package:wallpaper_app/modules/home/view/widgets/home_navigation_bar.dart';
import 'package:wallpaper_app/modules/home/view/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeNavigationBar(),
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text('Log out'),
                  onTap: () {
                    context.read<AuthViewModel>().logOutClickEvent();
                  },
                )
              ];
            },
          )
        ],
      ),
      body: const HomeScreenBody(),
    );
  }
}
