import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wallpaper_app/modules/auth/service/auth_service.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';

class FavouriteDatabaseService {
  final _client = FirebaseFirestore.instance;

  final AuthService _authService = AuthService();

  Future<List<WallpaperModel>?> getAllFavourites() async {
    final currentUser = _authService.getUser();
    if (currentUser == null) return null;
    final ref = _client
        .collection('users')
        .doc(currentUser.uid)
        .collection('favourites');

    final snapshot = await ref.get();

    return snapshot.docs
        .map((doc) => WallpaperModel.fromMap(doc.data()))
        .toList();
  }
}
