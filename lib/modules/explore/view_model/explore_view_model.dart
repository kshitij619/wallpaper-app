import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';
import 'package:wallpaper_app/modules/explore/services/explore_remote_service.dart';

class ExploreViewModel extends ChangeNotifier {
  List<WallpaperModel> wallpapers = [];

  final _service = ExploreRemoteService();
  void fetchWallpaper() async {
    final response = await _service.getWallpapers();
    response.fold(
      (l) {
        log(l.toString());
      },
      (r) {
        wallpapers = r.photos;
        notifyListeners();
      },
    );
  }
}
