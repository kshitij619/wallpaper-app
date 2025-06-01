import 'package:flutter/material.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';
import 'package:wallpaper_app/modules/wallpaper/service/wallpaper_database_service.dart';

class WallpaperViewModel extends ChangeNotifier {
  WallpaperViewModel({
    required this.model,
  });

  final WallpaperModel model;
  bool? isFavourite;

  final WallpaperDatabaseService _service = WallpaperDatabaseService();

  void checkIsFavourite() async {
    isFavourite = await _service.checkIsFavourite(model);
    notifyListeners();
  }

  void favouriteButtonClickEvent() async {
    if (isFavourite == true) {
      await _service.removeFromFavourites(model);
      isFavourite = false;
    } else {
      await _service.addToFavourites(model);
      isFavourite = true;
    }
    notifyListeners();
  }
}
