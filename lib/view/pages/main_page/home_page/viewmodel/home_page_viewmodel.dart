import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_app/core/global_models/recipe_model.dart';

import '../../../../../core/routing/router.gr.dart';
import '../../../../../core/routing/router_provider.dart';
import '../../../../../core/services/recipe_services.dart';

class HomePageVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;

  HomePageVM(this.ref) {
    router = ref.read(routerProvider);
  }
  TextEditingController searchController = TextEditingController();
  String? searchKey;
  void updateSearchText(String newSearchKey) {
    if (newSearchKey == "") {
      searchKey = null;
    } else {
      searchKey = newSearchKey;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}

final homePageVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => HomePageVM(ref));

final getAllCatsFutureP = FutureProvider.autoDispose
    .family<List<RecipeModel>, String?>((ref, searchKey) async {
  return await ref
      .read(recipeServicesProvider)
      .getHomePageRecipes(searchKey: searchKey);
});
