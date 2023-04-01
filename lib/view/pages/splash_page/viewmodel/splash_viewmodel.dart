import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/routing/router.gr.dart';
import '../../../../core/routing/router_provider.dart';

class SplashVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;

  SplashVM(this.ref) {
    router = ref.read(routerProvider);
  }
  Future<void> navigateUserAfterSplashDone(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3), () {
      router.replace(const MainRoute());
    });
  }
}

final splashVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => SplashVM(ref));
