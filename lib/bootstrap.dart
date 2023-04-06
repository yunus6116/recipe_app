import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_app/core/global_models/recipe_model.dart';

import 'core/init/cache/cache_manager.dart';
import 'core/routing/router.gr.dart';
import 'core/routing/router_provider.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  openHiveBoxes() async {
    Hive.registerAdapter<RecipeModel>(RecipeModelAdapter());
    Hive.registerAdapter<Images>(ImagesAdapter());
    Hive.registerAdapter<THUMBNAIL>(THUMBNAILAdapter());
    Hive.registerAdapter<Ingredients>(IngredientsAdapter());
    Hive.registerAdapter<TotalNutrients>(TotalNutrientsAdapter());
    Hive.registerAdapter<ENERCKCAL>(ENERCKCALAdapter());
    Hive.registerAdapter<SUGARAdded>(SUGARAddedAdapter());
    Hive.registerAdapter<TotalDaily>(TotalDailyAdapter());
    Hive.registerAdapter<Digest>(DigestAdapter());
    Hive.registerAdapter<Sub>(SubAdapter());
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
