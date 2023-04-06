import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/init/cache/cache_manager.dart';
import '../../../../../core/routing/router.gr.dart';
import '../../../../../core/routing/router_provider.dart';

final favouritesVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => FavouritesVM(ref));

class FavouritesVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;

  FavouritesVM(this.ref) {
    router = ref.read(routerProvider);
  }
  List<dynamic> favoritesList = [];
  void initFavouritesPage() {
    favoritesList = ref
            .read(cacheManagerProvider(BoxType.generalBox))
            .readFromBox<List<dynamic>?>(BoxKey.favourites) ??
        [];
  }

  void setFavouriteList(newList) {
    favoritesList = newList;
    notifyListeners();
  }
}
