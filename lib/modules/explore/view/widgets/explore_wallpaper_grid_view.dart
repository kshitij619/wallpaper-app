import 'package:flutter/material.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';
import 'package:wallpaper_app/modules/explore/view/widgets/explore_wallpaper_grid_view_item.dart';

class ExploreWallpaperGridView extends StatelessWidget {
  const ExploreWallpaperGridView({
    super.key,
    required this.wallpapers,
  });

  final List<WallpaperModel> wallpapers;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: wallpapers.length,
      padding: EdgeInsetsDirectional.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 9 / 16,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final wallpaper = wallpapers[index];
        return ExploreWallpaperGridViewItem(
          wallpaper: wallpaper,
        );
      },
    );
  }
}
