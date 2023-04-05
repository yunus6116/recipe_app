import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
}
