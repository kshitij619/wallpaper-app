import 'package:wallpaper_app/modules/explore/models/wallpaper_url_model.dart';

class WallpaperModel {
  WallpaperModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.alt,
  });

  factory WallpaperModel.fromMap(Map<String, dynamic> map) {
    return WallpaperModel(
      id: map['id'] as int,
      width: map['width'] as int,
      height: map['height'] as int,
      url: map['url'] as String,
      photographer: map['photographer'] as String,
      photographerUrl: map['photographer_url'] as String,
      photographerId: map['photographer_id'] as int,
      avgColor: map['avg_color'] as String,
      src: WallpaperUrlModel.fromMap(map['src'] as Map<String, dynamic>),
      alt: map['alt'] as String,
    );
  }

  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final WallpaperUrlModel src;
  final String alt;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'photographer': photographer,
      'photographer_url': photographerUrl,
      'photographer_id': photographerId,
      'avgColor': avgColor,
      'src': src.toMap(),
      'alt': alt,
    };
  }
}
