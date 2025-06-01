import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wallpaper_app/modules/auth/service/auth_service.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';

class WallpaperDatabaseService {
  final _client = FirebaseFirestore.instance;
  final _authService = AuthService();

  DocumentReference<Map<String, dynamic>>? wallpaperRef(WallpaperModel model) {
    final currentUser = _authService.getUser();
    if (currentUser == null) return null;
    return _client
        .collection('users')
        .doc(currentUser.uid)
        .collection('favourites')
        .doc(model.id.toString());
  }

  Future<bool?> checkIsFavourite(WallpaperModel model) async {
    final ref = wallpaperRef(model);
    if (ref == null) return null;
    return await ref.get().then((value) => value.exists);
  }

  Future<void> removeFromFavourites(WallpaperModel model) async {
    final ref = wallpaperRef(model);
    if (ref == null) return;
    await ref.delete();
  }

  Future<void> addToFavourites(WallpaperModel model) async {
    final ref = wallpaperRef(model);
    if (ref == null) return;
    await ref.set(model.toMap());
  }
}
