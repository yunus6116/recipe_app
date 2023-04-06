import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'constants/favourite_constants.dart';
import 'widgets/favourites_page_recipe_list_widget.dart';
import 'viewmodel/favourites_page_viewmodel.dart';

import '../../../shared/styles/text_styles.dart';
import '../../../shared/widgets/custom_appbar.dart';

class FavouritesPage extends StatefulHookConsumerWidget {
  const FavouritesPage({super.key});

  @override
  ConsumerState<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends ConsumerState<FavouritesPage> {
  @override
  void initState() {
    ref.read(favouritesVMProvider).initFavouritesPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: FavouritesPageRecipeListWidget(),
        ),
      ),
    );
  }

  CustomAppBar _buildAppbar() {
    return CustomAppBar(
      title: FavouriteConstants.appBarTitle,
      titleStyle: AppTextStyles.heading7,
    );
  }
}
