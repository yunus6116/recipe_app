import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/routing/router.gr.dart';
import '../../../../../core/routing/router_provider.dart';

final myProfileVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => MyProfileVM(ref));

class MyProfileVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;

  MyProfileVM(this.ref) {
    router = ref.read(routerProvider);
  }
}
