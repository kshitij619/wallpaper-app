import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';
import 'package:wallpaper_app/modules/explore/services/explore_remote_service.dart';

class ExploreViewModel extends ChangeNotifier {
  List<WallpaperModel> wallpapers = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final _service = ExploreRemoteService();
  void fetchWallpaper() async {
    final response = await _service.getWallpapers();
    response.fold(
      (l) {
        log(l.toString());
      },
      (r) {
        wallpapers = [...wallpapers, ...r.photos];
        notifyListeners();
      },
    );
  }

  void loadNext() {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();
    fetchWallpaper();
    try {
      _service.loadNextPage();
      log('loadNext');
    } catch (e, s) {
      log('$e', stackTrace: s);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
