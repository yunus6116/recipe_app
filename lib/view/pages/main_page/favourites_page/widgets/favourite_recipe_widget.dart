import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/global_models/recipe_model.dart';
import '../../../../shared/shimmer/shimmer_effect.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/text_styles.dart';
import '../../home_page/viewmodel/home_page_viewmodel.dart';

class FavouriteRecipeWidget extends HookConsumerWidget {
  const FavouriteRecipeWidget({
    super.key,
    required this.recipeModel,
  });

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Dismissible(
        key: ValueKey<String>(recipeModel.uri!),
        direction: DismissDirection.endToStart,
        onDismissed: (DismissDirection direction) {
          ref.read(homePageVMProvider).clickFavouriteButton(
                true,
                recipeModel,
                fromFavouritePage: true,
              );
        },
        background: Container(
          color: Colors.red,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: ListTile(
          leading: SizedBox(
            width: 100,
            child: CachedNetworkImage(
              imageUrl: recipeModel.image ?? '',
              placeholder: (BuildContext context, String imageUrl) =>
                  ShimmerEffect(
                child: Container(
                  height: 60,
                  width: 100,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) {
                return SizedBox(
                  height: 60,
                  width: 100,
                  child: Image.asset('assets/png/food.png'),
                );
              },
              fit: BoxFit.fill,
            ),
          ),
          title: Text(
            recipeModel.label ?? 'Food',
            style: AppTextStyles.body2,
          ),
          subtitle: Text(
            'Meal Type: ${recipeModel.mealType?[0] ?? '-'}',
            style: AppTextStyles.body4.copyWith(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
