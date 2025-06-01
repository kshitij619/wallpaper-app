import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/modules/wallpaper/view/widgets/favourite_wallpaper_icon_button.dart';
import 'package:wallpaper_app/modules/wallpaper/view_model/wallpaper_view_model.dart';

class WallpaperScreen extends StatefulWidget {
  const WallpaperScreen({super.key});

  @override
  State<WallpaperScreen> createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (mounted) context.read<WallpaperViewModel>().checkIsFavourite();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper'),
        actions: [
          FavouriteWallpaperIconButton(),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Image(
              fit: BoxFit.contain,
              image: NetworkImage(
                context.read<WallpaperViewModel>().model.src.large,
              )),
        ),
      ),
    );
  }
}
