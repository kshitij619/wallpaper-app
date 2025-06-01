import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/modules/explore/view/explore_page.dart';
import 'package:wallpaper_app/modules/explore/view_model/explore_view_model.dart';

class ExplorePageProvider extends StatelessWidget {
  const ExplorePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExploreViewModel(),
      child: const ExplorePage(),
    );
  }
}
