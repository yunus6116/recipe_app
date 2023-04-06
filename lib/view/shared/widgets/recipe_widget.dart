import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_app/core/routing/router.gr.dart';

import '../../../core/global_models/recipe_model.dart';
import '../../pages/main_page/home_page/viewmodel/home_page_viewmodel.dart';
import '../shimmer/shimmer_effect.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';

class RecipeWidget extends StatefulHookConsumerWidget {
  const RecipeWidget({
    super.key,
    required this.recipeModel,
    this.fromFavouritePage = false,
  });
  final RecipeModel recipeModel;
  final bool fromFavouritePage;

  @override
  ConsumerState<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends ConsumerState<RecipeWidget> {
  @override
  Widget build(BuildContext context) {
    bool isFavourite =
        ref.read(homePageVMProvider).checkIfFavourite(widget.recipeModel);
    return InkWell(
      onTap: () async {
        // Navigate to Recipe Detail
        await context
            .navigateTo(RecipeDetailRoute(recipeModel: widget.recipeModel));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: 110,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: widget.recipeModel.images?.rEGULAR?.url ?? '',
                        placeholder: (BuildContext context, String imageUrl) =>
                            ShimmerEffect(
                          child: Container(
                            height: 100,
                            width: 120,
                            color: Colors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) {
                          return SizedBox(
                            height: 110,
                            width: double.infinity,
                            child: Image.asset('assets/png/food.png'),
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      widget.recipeModel.label != null
                          ? widget.recipeModel.label!.length > 25
                              ? '${widget.recipeModel.label!.substring(0, 23)}..'
                              : widget.recipeModel.label!
                          : 'Food',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(.05),
              ),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: InkWell(
                  onTap: () {
                    ref.read(homePageVMProvider).clickFavouriteButton(
                          isFavourite,
                          widget.recipeModel,
                          fromDetailPage: widget.fromFavouritePage,
                        );
                    setState(() {});
                  },
                  child: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.primary,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
