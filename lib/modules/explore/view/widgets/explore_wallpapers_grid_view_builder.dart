import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';
import 'package:wallpaper_app/modules/explore/view/widgets/explore_wallpaper_grid_view_item.dart';
import 'package:wallpaper_app/modules/explore/view_model/explore_view_model.dart';

class ExploreWallpapersGridViewBuilder extends StatefulWidget {
  const ExploreWallpapersGridViewBuilder({super.key});

  @override
  State<ExploreWallpapersGridViewBuilder> createState() =>
      _ExploreWallpapersGridViewBuilderState();
}

class _ExploreWallpapersGridViewBuilderState
    extends State<ExploreWallpapersGridViewBuilder> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (mounted) context.read<ExploreViewModel>().fetchWallpaper();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ExploreViewModel, List<WallpaperModel>>(
      selector: (_, vm) => vm.wallpapers,
      builder: (context, wallpapers, child) {
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
            return ExploreWallpaperGridViewItem(wallpaper: wallpaper);
          },
        );
      },
    );
  }
}
