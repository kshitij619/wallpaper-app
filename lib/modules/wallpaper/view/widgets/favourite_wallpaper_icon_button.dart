import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/modules/wallpaper/view_model/wallpaper_view_model.dart';

class FavouriteWallpaperIconButton extends StatelessWidget {
  const FavouriteWallpaperIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<WallpaperViewModel, bool?>(
      selector: (context, vm) => vm.isFavourite,
      builder: (context, isFavourite, child) {
        if (isFavourite == null) return SizedBox();
        return IconButton(
          icon: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: () {
            context.read<WallpaperViewModel>().favouriteButtonClickEvent();
          },
        );
      },
    );
  }
}
