import 'package:flutter/material.dart';
import 'package:wallpaper_app/modules/explore/view/widgets/explore_page_provider.dart';
import 'package:wallpaper_app/modules/favorites/view/favorites_page.dart';
import 'package:wallpaper_app/modules/home/model/bottom_nav_model.dart';
import 'package:wallpaper_app/modules/profile/view/profile_page.dart';

class HomeViewModel extends ChangeNotifier {
  final navigationItems = const [
    BottomNavModel(
      name: 'Explore',
      icon: Icon(Icons.home),
      page: ExplorePageProvider(),
    ),
    BottomNavModel(
      name: 'Favorites',
      icon: Icon(Icons.favorite),
      page: FavoritesPage(),
    ),
    BottomNavModel(
      name: 'Profile',
      icon: Icon(Icons.person),
      page: ProfilePage(),
    ),
  ];

  int selectedIndex = 0;

  void indexChangedEvent(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Widget get selectedPage => navigationItems[selectedIndex].page;
}
