import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/styles/text_styles.dart';
import '../../../shared/widgets/custom_appbar.dart';

class MyProfilePage extends HookConsumerWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: const SafeArea(
        child: Center(child: Text('Profile')),
      ),
    );
  }

  CustomAppBar _buildAppbar() {
    return CustomAppBar(
      title: 'Profile',
      titleStyle: AppTextStyles.heading7,
    );
  }
}
