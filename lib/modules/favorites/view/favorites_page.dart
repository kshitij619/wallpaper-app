import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';
import 'package:wallpaper_app/modules/explore/view/widgets/explore_wallpaper_grid_view.dart';
import 'package:wallpaper_app/modules/favorites/view_model/favourite_view_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (mounted) context.read<FavouriteViewModel>().fetchWallpapers();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<FavouriteViewModel, List<WallpaperModel>>(
      selector: (_, vm) => vm.wallpapers,
      builder: (context, wallpapers, child) {
        return RefreshIndicator(
          onRefresh: context.read<FavouriteViewModel>().fetchWallpapers,
          child: ExploreWallpaperGridView(
            wallpapers: wallpapers,
          ),
        );
      },
    );
  }
}
