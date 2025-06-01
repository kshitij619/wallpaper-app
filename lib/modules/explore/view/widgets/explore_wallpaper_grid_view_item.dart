import 'package:flutter/material.dart';
import 'package:wallpaper_app/modules/explore/models/wallpaper_model.dart';
import 'package:wallpaper_app/modules/wallpaper/view/widgets/wallpaper_screen_provider.dart';

class ExploreWallpaperGridViewItem extends StatelessWidget {
  const ExploreWallpaperGridViewItem({
    super.key,
    required this.wallpaper,
  });

  final WallpaperModel wallpaper;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WallpaperScreenProvider(model: wallpaper),
          ),
        );
      },
      child: Container(
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
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
      ),
    );
  }
}
