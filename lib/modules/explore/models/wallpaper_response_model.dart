import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';

class WallpaperResponseModel {
  WallpaperResponseModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
  });

  final int page;
  final int perPage;
  final List<WallpaperModel> photos;
  final int totalResults;

  factory WallpaperResponseModel.fromMap(Map<String, dynamic> map) {
    return WallpaperResponseModel(
      page: map['page'] as int,
      perPage: map['per_page'] as int,
      photos: (map['photos'] as List)
          .map(
            (e) => WallpaperModel.fromMap(e),
          )
          .toList(),
      totalResults: map['total_results'] as int,
    );
  }
}
