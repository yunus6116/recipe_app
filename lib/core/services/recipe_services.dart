import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_app/core/global_models/recipe_model.dart';
import 'package:recipe_app/core/init/network_manager/network_manager.dart';

abstract class IRecipeServices {
  Future<List<RecipeModel>> getRecipes();
  Future<List<RecipeModel>> getHomePageRecipes({String? searchKey});
}

class RecipeServices extends IRecipeServices {
  final Ref ref;
  RecipeServices(this.ref);
  @override
  Future<List<RecipeModel>> getHomePageRecipes({String? searchKey}) async {
    try {
      final response =
          await ref.read(networkManagerProvider).get('', queryParameters: {
        "q": searchKey ?? "Alcohol-Free",
        "app_id": "8eac45cb",
        "app_key": "89147efd9b4c51a7c6c9becf57b0c0a9",
        "type": "public"
      });
      return List<RecipeModel>.from(response.data["hits"]
          .map((rsp) => RecipeModel.fromJson(rsp["recipe"])));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RecipeModel>> getRecipes() {
    // TODO: implement getRecipes
    throw UnimplementedError();
  }
}

final recipeServicesProvider = Provider((ref) => RecipeServices(ref));
