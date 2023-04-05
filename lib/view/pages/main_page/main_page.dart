import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/routing/router.gr.dart';
import '../../shared/widgets/focus_escape.dart';
import '../../shared/widgets/recipe_bottom_navigation_bar.dart';

class MainPage extends HookWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        animationDuration: const Duration(milliseconds: 500),
        builder: (context, child, animation) => FocusEscape(
              child: FadeTransition(opacity: animation, child: child),
            ),
        bottomNavigationBuilder: (_, tabsRouter) => RecipeBottomNavigationBar(
              tabsRouter: tabsRouter,
            ),
        routes: const [HomeTabRouter(), FavouritesTabRouter()]);
  }
}
