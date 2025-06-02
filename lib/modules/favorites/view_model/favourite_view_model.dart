import 'package:flutter/material.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';
import 'package:wallpaper_app/modules/favorites/service/favourite_database_service.dart';

class FavouriteViewModel extends ChangeNotifier {
  final FavouriteDatabaseService _service = FavouriteDatabaseService();

  List<WallpaperModel> wallpapers = [];
  Future<void> fetchWallpapers() async {
    final result = await _service.getAllFavourites();
    wallpapers = result ?? [];
    notifyListeners();
  }
}
