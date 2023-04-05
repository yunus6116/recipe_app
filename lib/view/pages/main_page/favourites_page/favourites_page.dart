import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/styles/text_styles.dart';
import '../../../shared/widgets/custom_appbar.dart';

class FavouritesPage extends HookConsumerWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: const SafeArea(
        child: Center(child: Text('Favourites')),
      ),
    );
  }

  CustomAppBar _buildAppbar() {
    return CustomAppBar(
      title: 'My Favourites',
      titleStyle: AppTextStyles.heading7,
    );
  }
}
