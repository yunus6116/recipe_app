import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'constants/home_constants.dart';
import 'widgets/home_page_recipe_list_widget.dart';
import 'widgets/home_page_search_widget.dart';
import '../../../shared/styles/text_styles.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/widgets/custom_appbar.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: const [
              // Search Bar
              HomePageSearchWidget(),
              // Display Recipes
              HomePageRecipeListWidget(),
            ],
          ),
        ),
      ),
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: HomeConstants.appBarTitle,
      titleStyle: AppTextStyles.heading1.copyWith(color: AppColors.primary),
    );
  }
}
