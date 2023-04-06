import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_app/core/global_models/recipe_model.dart';
import 'package:recipe_app/view/shared/styles/text_styles.dart';
import 'package:recipe_app/view/shared/widgets/controlled_text_field.dart';

import '../../../shared/shimmer/shimmer_effect.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/widgets/base_async_provider_widget.dart';
import '../../../shared/widgets/custom_appbar.dart';
import '../../../shared/widgets/recipe_widget.dart';
import 'viewmodel/home_page_viewmodel.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final searchKey =
        ref.watch(homePageVMProvider.select((value) => value.searchKey));
    final searchController =
        ref.watch(homePageVMProvider.select((value) => value.searchController));
    final getRecipesFuture = ref.watch(getRecipesFutureP(searchKey));
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Recipely App',
        titleStyle: AppTextStyles.heading1.copyWith(color: AppColors.primary),
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
                hintText: 'Search recipes',
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
                                return RecipeWidget(
                                    recipeModel: recipes[index]);
                              },
                            )
                          : Center(
                              child: Text(
                                "Couldn't find a recipe\nTry to search again!",
                                style: AppTextStyles.heading1,
                              ),
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
