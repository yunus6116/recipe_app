import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_app/core/routing/router.gr.dart';
import 'package:recipe_app/view/pages/main_page/favourites_page/viewmodel/favourites_page_viewmodel.dart';
import 'package:recipe_app/view/pages/main_page/favourites_page/widgets/favourite_recipe_widget.dart';

import '../../../shared/styles/colors.dart';
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
    List<dynamic> favouriteRecipes =
        ref.watch(favouritesVMProvider).favoritesList;
    return Scaffold(
      appBar: _buildAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: favouriteRecipes.isNotEmpty
              ? ListView.builder(
                  itemCount: favouriteRecipes.length,
                  itemBuilder: (context, index) {
                    return FavouriteRecipeWidget(
                      recipeModel: favouriteRecipes[index],
                    );
                  },
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/png/favourite_food.png'),
                    const SizedBox(height: 12),
                    Text(
                      "Save the recipes you like",
                      style: AppTextStyles.heading1
                          .copyWith(color: AppColors.primary),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'It is enough to touch the heart for this',
                          style: AppTextStyles.body1
                              .copyWith(color: AppColors.primary),
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                            onTap: () async {
                              await context.navigateTo(
                                  const MainRoute(children: [HomeTabRouter()]));
                            },
                            child: const Icon(
                              Icons.favorite,
                              color: AppColors.primary,
                            )),
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }

  CustomAppBar _buildAppbar() {
    return CustomAppBar(
      title: 'My Favourites',
      titleStyle: AppTextStyles.heading7,
    );
  }
}
