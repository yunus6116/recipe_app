import 'package:flutter/material.dart';

import '../../../../core/global_models/recipe_model.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';
import '../constants/recipe_detail_constants.dart';

class RecipeDetailIngredientsWidget extends StatelessWidget {
  const RecipeDetailIngredientsWidget({
    super.key,
    required this.recipeModel,
  });
  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          RecipeDetailConstants.ingredientsText,
          style: AppTextStyles.heading1,
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          itemCount: recipeModel.ingredients != null
              ? recipeModel.ingredients!.length
              : 0,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '- ${recipeModel.ingredients?[index].food ?? ''}',
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.primary,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
