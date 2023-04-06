import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'bootstrap.dart';
import 'env.dart';
import 'view/shared/widgets/focus_escape.dart';
import 'core/global_constants/global_constants.dart';
import 'core/routing/router_provider.dart';

void main() async {
  bootstrap(() => const MyApp());
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FocusEscape(
      child: MaterialApp.router(
        scaffoldMessengerKey: snackBarKey,
        color: Colors.green,
        routeInformationParser: ref.read(routerProvider).defaultRouteParser(),
        routerDelegate: ref.read(routerProvider).delegate(),
        debugShowCheckedModeBanner: false,
        title: Environment.appTitle,
      ),
    );
  }
}
