// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:auto_route/empty_router_widgets.dart' as _i4;
import 'package:flutter/material.dart' as _i8;
import 'package:recipe_app/core/global_models/recipe_model.dart' as _i9;
import 'package:recipe_app/view/pages/main_page/favourites_page/favourites_page.dart'
    as _i6;
import 'package:recipe_app/view/pages/main_page/home_page/home_page.dart'
    as _i5;
import 'package:recipe_app/view/pages/main_page/main_page.dart' as _i2;
import 'package:recipe_app/view/pages/recipe_detail_page/recipe_detail_page.dart'
    as _i3;
import 'package:recipe_app/view/pages/splash_page/splash_page.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    RecipeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeDetailRouteArgs>();
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.RecipeDetailPage(
          key: args.key,
          recipeModel: args.recipeModel,
        ),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    FavouritesTabRouter.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.FavouritesPage(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          MainRoute.name,
          path: '/main-page',
          children: [
            _i7.RouteConfig(
              HomeTabRouter.name,
              path: 'home-tab',
              parent: MainRoute.name,
              children: [
                _i7.RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                )
              ],
            ),
            _i7.RouteConfig(
              FavouritesTabRouter.name,
              path: 'favourites-tab',
              parent: MainRoute.name,
              children: [
                _i7.RouteConfig(
                  FavouritesRoute.name,
                  path: '',
                  parent: FavouritesTabRouter.name,
                )
              ],
            ),
          ],
        ),
        _i7.RouteConfig(
          RecipeDetailRoute.name,
          path: '/recipe-detail-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main-page',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.RecipeDetailPage]
class RecipeDetailRoute extends _i7.PageRouteInfo<RecipeDetailRouteArgs> {
  RecipeDetailRoute({
    _i8.Key? key,
    required _i9.RecipeModel recipeModel,
  }) : super(
          RecipeDetailRoute.name,
          path: '/recipe-detail-page',
          args: RecipeDetailRouteArgs(
            key: key,
            recipeModel: recipeModel,
          ),
        );

  static const String name = 'RecipeDetailRoute';
}

class RecipeDetailRouteArgs {
  const RecipeDetailRouteArgs({
    this.key,
    required this.recipeModel,
  });

  final _i8.Key? key;

  final _i9.RecipeModel recipeModel;

  @override
  String toString() {
    return 'RecipeDetailRouteArgs{key: $key, recipeModel: $recipeModel}';
  }
}

/// generated route for
/// [_i4.EmptyRouterPage]
class HomeTabRouter extends _i7.PageRouteInfo<void> {
  const HomeTabRouter({List<_i7.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home-tab',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class FavouritesTabRouter extends _i7.PageRouteInfo<void> {
  const FavouritesTabRouter({List<_i7.PageRouteInfo>? children})
      : super(
          FavouritesTabRouter.name,
          path: 'favourites-tab',
          initialChildren: children,
        );

  static const String name = 'FavouritesTabRouter';
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.FavouritesPage]
class FavouritesRoute extends _i7.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: '',
        );

  static const String name = 'FavouritesRoute';
}
