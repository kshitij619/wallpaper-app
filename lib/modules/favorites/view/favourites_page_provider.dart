import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/modules/favorites/view/favorites_page.dart';
import 'package:wallpaper_app/modules/favorites/view_model/favourite_view_model.dart';

class FavouritesPageProvider extends StatelessWidget {
  const FavouritesPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteViewModel(),
      child: const FavoritesPage(),
    );
  }
}
