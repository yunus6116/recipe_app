import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_app/core/global_models/recipe_model.dart';
import 'package:recipe_app/view/shared/styles/text_styles.dart';
import 'package:recipe_app/view/shared/widgets/controlled_text_field.dart';

import '../../../shared/shimmer/shimmer_effect.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/widgets/base_async_provider_widget.dart';
import '../../../shared/widgets/custom_appbar.dart';
import 'viewmodel/home_page_viewmodel.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchKey =
        ref.watch(homePageVMProvider.select((value) => value.searchKey));
    final searchController =
        ref.watch(homePageVMProvider.select((value) => value.searchController));
    final getRecipesFuture = ref.watch(getAllCatsFutureP(searchKey));
    InkWell buildRecipeItem(BuildContext context, RecipeModel recipeModel) {
      return InkWell(
        onTap: () {
          // Navigate to Detail
          print(recipeModel.label);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[200],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: CachedNetworkImage(
                  imageUrl: recipeModel.images?.tHUMBNAIL?.url ?? '',
                  placeholder: (BuildContext context, String imageUrl) =>
                      ShimmerEffect(
                    child: Container(
                      height: 100,
                      width: 120,
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return const Text('Error');
                  },
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                recipeModel.label != null
                    ? recipeModel.label!.length > 20
                        ? '${recipeModel.label!.substring(0, 18)}..'
                        : recipeModel.label!
                    : 'Food',
                textAlign: TextAlign.center,
                style: AppTextStyles.body2,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Recipely App',
        titleStyle: AppTextStyles.heading1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ControlledTextField(
                textEditingController: searchController,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                textStyle: AppTextStyles.body1,
                hintText: 'Search',
                placeHolderTextStyle: AppTextStyles.body1,
                focusedBorderColor: AppColors.dustyGray700,
                unFocusedBorderColor: AppColors.dustyGray400,
                onFiedlSubmitted: (searchKey) {
                  ref.read(homePageVMProvider).updateSearchText(searchKey);
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    ref
                        .read(homePageVMProvider)
                        .updateSearchText(searchController.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
              Expanded(
                child: BaseAsyncProviderWidget(
                    value: getRecipesFuture,
                    loadingWidget: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 12,
                                childAspectRatio: 1.2,
                              ),
                              itemCount: recipes.length,
                              itemBuilder: (context, index) {
                                return buildRecipeItem(context, recipes[index]);
                              },
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
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
                                    color: Colors.white,
                                  ),
                                );
                              },
                            );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
