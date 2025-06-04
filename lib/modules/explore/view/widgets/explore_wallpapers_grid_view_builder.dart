import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';
import 'package:wallpaper_app/modules/explore/view/widgets/explore_wallpaper_grid_view.dart';
import 'package:wallpaper_app/modules/explore/view_model/explore_view_model.dart';

class ExploreWallpapersGridViewBuilder extends StatefulWidget {
  const ExploreWallpapersGridViewBuilder({super.key});

  @override
  State<ExploreWallpapersGridViewBuilder> createState() =>
      _ExploreWallpapersGridViewBuilderState();
}

class _ExploreWallpapersGridViewBuilderState
    extends State<ExploreWallpapersGridViewBuilder> {
  final scrollController = ScrollController();
  final exploreViewModel = ExploreViewModel();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    Future.microtask(
      () {
        if (mounted) context.read<ExploreViewModel>().fetchWallpaper();
      },
    );
  }

  void _scrollListener() {
    bool isLoading = exploreViewModel.isLoading;

    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 100 &&
        !isLoading) {
      exploreViewModel.loadNext();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ExploreViewModel, List<WallpaperModel>>(
      selector: (_, vm) => vm.wallpapers,
      builder: (context, wallpapers, child) {
        return ExploreWallpaperGridView(
          wallpapers: wallpapers,
          scrollController: scrollController,
        );
      },
    );
  }
}
