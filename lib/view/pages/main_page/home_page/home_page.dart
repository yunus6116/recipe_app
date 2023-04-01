import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../shared/styles/text_styles.dart';
import '../../../shared/widgets/custom_appbar.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: const SafeArea(
        child: Center(
          child: Text(
            'Home Page',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  CustomAppBar _buildAppbar() {
    return CustomAppBar(
      title: 'Welcome to Recipely',
      titleStyle: AppTextStyles.heading7,
    );
  }
}
