import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/routing/router.gr.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/text_styles.dart';
import '../constants/favourite_constants.dart';
import '../viewmodel/favourites_page_viewmodel.dart';
import 'favourites_page_recipe_widget.dart';

class FavouritesPageRecipeListWidget extends HookConsumerWidget {
  const FavouritesPageRecipeListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<dynamic> favouriteRecipes =
        ref.watch(favouritesVMProvider).favoritesList;
    return favouriteRecipes.isNotEmpty
        ? ListView.builder(
            itemCount: favouriteRecipes.length,
            itemBuilder: (context, index) {
              return FavouritesPageRecipeWidget(
                recipeModel: favouriteRecipes[index],
              );
            },
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(FavouriteConstants.emptyListImagePath),
              const SizedBox(height: 12),
              Text(
                FavouriteConstants.emptyListTitle,
                style:
                    AppTextStyles.heading1.copyWith(color: AppColors.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FavouriteConstants.emptyListSubTitle,
                    style:
                        AppTextStyles.body1.copyWith(color: AppColors.primary),
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
          );
  }
}
