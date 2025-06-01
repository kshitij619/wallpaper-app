import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';
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
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    wallpaper.src.portrait,
                  ),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.camera,
                            color: Colors.white70,
                            size: 12,
                          ),
                          SizedBox(width: 4),
                          Text(
                            wallpaper.photographer,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: Colors.white60,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        wallpaper.alt,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
