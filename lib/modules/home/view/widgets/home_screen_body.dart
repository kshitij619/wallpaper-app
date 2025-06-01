import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/modules/home/view_model/home_view_model.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, Widget>(
      selector: (context, viewModel) => viewModel.selectedPage,
      builder: (context, selectedPage, child) {
        return selectedPage;
      },
    );
  }
}
