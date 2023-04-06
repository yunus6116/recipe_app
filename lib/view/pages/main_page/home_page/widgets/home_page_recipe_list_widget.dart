import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/global_models/recipe_model.dart';
import '../../../../shared/shimmer/shimmer_effect.dart';
import '../../../../shared/styles/text_styles.dart';
import '../../../../shared/widgets/base_async_provider_widget.dart';
import '../../../../shared/widgets/recipe_widget.dart';
import '../constants/home_constants.dart';
import '../viewmodel/home_page_viewmodel.dart';

class HomePageRecipeListWidget extends HookConsumerWidget {
  const HomePageRecipeListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchKey =
        ref.watch(homePageVMProvider.select((value) => value.searchKey));

    final getRecipesFuture = ref.watch(getRecipesFutureP(searchKey));
    return Expanded(
      child: BaseAsyncProviderWidget(
        value: getRecipesFuture,
        loadingWidget: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return ShimmerEffect(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200],
                ),
              ),
            );
          },
        ),
        builder: (List<RecipeModel> recipes) {
          return recipes.isNotEmpty
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeWidget(recipeModel: recipes[index]);
                  },
                )
              : Center(
                  child: Text(
                    HomeConstants.noResultText,
                    style: AppTextStyles.heading1,
                  ),
                );
        },
      ),
    );
  }
}
