import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/text_styles.dart';
import '../../../../shared/widgets/controlled_text_field.dart';
import '../constants/home_constants.dart';
import '../viewmodel/home_page_viewmodel.dart';

class HomePageSearchWidget extends HookConsumerWidget {
  const HomePageSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController =
        ref.watch(homePageVMProvider.select((value) => value.searchController));
    return ControlledTextField(
      textEditingController: searchController,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      textStyle: AppTextStyles.body1,
      hintText: HomeConstants.searchHintText,
      placeHolderTextStyle: AppTextStyles.body1,
      focusedBorderColor: AppColors.dustyGray700,
      unFocusedBorderColor: AppColors.dustyGray400,
      onFiedlSubmitted: (searchKey) {
        ref.read(homePageVMProvider).updateSearchText(searchKey);
      },
      suffixIcon: IconButton(
        onPressed: () {
          ref.read(homePageVMProvider).updateSearchText(searchController.text);
        },
        icon: const Icon(Icons.search),
      ),
    );
  }
}
