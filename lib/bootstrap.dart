import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/init/cache/cache_manager.dart';
import 'core/routing/router.gr.dart';
import 'core/routing/router_provider.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  openHiveBoxes() async {
    await Hive.openBox(BoxType.generalBox.name);
  }

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await openHiveBoxes();

  final appRouter = AppRouter();

  runApp(
    ProviderScope(overrides: [
      routerProvider.overrideWithValue(appRouter),
    ], child: await builder()),
  );
}
