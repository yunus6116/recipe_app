// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_app/core/global_models/recipe_model.dart';
import 'package:recipe_app/view/pages/main_page/favourites_page/viewmodel/favourites_page_viewmodel.dart';

import '../../../../../core/init/cache/cache_manager.dart';
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

  bool checkIfFavourite(RecipeModel recipeModel) {
    List<dynamic>? favouriteRecipes = ref
        .read(cacheManagerProvider(BoxType.generalBox))
        .readFromBox(BoxKey.favourites);
    if (favouriteRecipes != null) {
      for (RecipeModel recipe in favouriteRecipes) {
        if (recipe.uri == recipeModel.uri) {
          return true;
        }
      }
    }
    return false;
  }

  void clickFavouriteButton(bool isFavourite, RecipeModel recipeModel,
      {bool fromDetailPage = false, bool fromFavouritePage = false}) {
    final favouriteRecipes = ref
            .read(cacheManagerProvider(BoxType.generalBox))
            .readFromBox<List<dynamic>?>(BoxKey.favourites) ??
        [];
    if (favouriteRecipes.isEmpty) {
      favouriteRecipes.add(recipeModel);
    } else {
      if (isFavourite) {
        for (RecipeModel recipe in favouriteRecipes) {
          if (recipe.uri == recipeModel.uri) {
            favouriteRecipes
                .removeWhere((element) => element.url == recipeModel.url);
            break;
          }
        }
      } else {
        favouriteRecipes.add(recipeModel);
      }
    }
    ref.read(favouritesVMProvider).setFavouriteList(favouriteRecipes);
    ref.read(cacheManagerProvider(BoxType.generalBox)).writeToBox(
          BoxKey.favourites,
          favouriteRecipes,
        );
    if (fromDetailPage || fromFavouritePage) {
      ref.refresh(getRecipesFutureP(searchKey));
    }
  }
}

final homePageVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => HomePageVM(ref));

final getRecipesFutureP = FutureProvider.autoDispose
    .family<List<RecipeModel>, String?>((ref, searchKey) async {
  return await ref
      .read(recipeServicesProvider)
      .getHomePageRecipes(searchKey: searchKey);
});
