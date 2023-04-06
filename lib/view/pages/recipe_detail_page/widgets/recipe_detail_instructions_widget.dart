import 'package:flutter/material.dart';

import '../../../../core/global_models/recipe_model.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';
import '../constants/recipe_detail_constants.dart';

class RecipeDetailInstructionsWidget extends StatelessWidget {
  const RecipeDetailInstructionsWidget({
    super.key,
    required this.recipeModel,
  });
  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          RecipeDetailConstants.instructionsText,
          style: AppTextStyles.heading1,
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          itemCount: recipeModel.ingredientLines != null
              ? recipeModel.ingredientLines!.length
              : 0,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '- ${recipeModel.ingredientLines?[index] ?? ''}',
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.primary,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
