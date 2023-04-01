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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i7;
import 'package:recipe_app/view/pages/main_page/home_page/home_page.dart'
    as _i4;
import 'package:recipe_app/view/pages/main_page/main_page.dart' as _i2;
import 'package:recipe_app/view/pages/main_page/my_profile_page/my_profile_page.dart'
    as _i5;
import 'package:recipe_app/view/pages/splash_page/splash_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    MyProfileTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.MyProfilePage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          MainRoute.name,
          path: '/main-page',
          children: [
            _i6.RouteConfig(
              HomeTabRouter.name,
              path: 'home-tab',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                )
              ],
            ),
            _i6.RouteConfig(
              MyProfileTabRouter.name,
              path: 'my-profile-tab',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(
                  MyProfileRoute.name,
                  path: '',
                  parent: MyProfileTabRouter.name,
                )
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main-page',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class HomeTabRouter extends _i6.PageRouteInfo<void> {
  const HomeTabRouter({List<_i6.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home-tab',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class MyProfileTabRouter extends _i6.PageRouteInfo<void> {
  const MyProfileTabRouter({List<_i6.PageRouteInfo>? children})
      : super(
          MyProfileTabRouter.name,
          path: 'my-profile-tab',
          initialChildren: children,
        );

  static const String name = 'MyProfileTabRouter';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.MyProfilePage]
class MyProfileRoute extends _i6.PageRouteInfo<void> {
  const MyProfileRoute()
      : super(
          MyProfileRoute.name,
          path: '',
        );

  static const String name = 'MyProfileRoute';
}