import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/routing/router.gr.dart';
import '../../../../../core/routing/router_provider.dart';

class HomePageVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;

  HomePageVM(this.ref) {
    router = ref.read(routerProvider);
  }
}

final homePageVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => HomePageVM(ref));
