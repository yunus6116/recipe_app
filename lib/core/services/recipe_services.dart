import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../global_models/recipe_model.dart';
import '../init/network_manager/network_manager.dart';
import '../../env.dart';

abstract class IRecipeServices {
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
        "app_id": Environment.appId,
        "app_key": Environment.appKey,
        "type": "public"
      });
      return List<RecipeModel>.from(response.data["hits"]
          .map((rsp) => RecipeModel.fromJson(rsp["recipe"])));
    } catch (e) {
      rethrow;
    }
  }
}

final recipeServicesProvider = Provider((ref) => RecipeServices(ref));
