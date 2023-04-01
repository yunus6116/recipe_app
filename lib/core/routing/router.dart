import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import '../../view/pages/main_page/home_page/home_page.dart';
import '../../view/pages/main_page/main_page.dart';
import '../../view/pages/main_page/my_profile_page/my_profile_page.dart';
import '../../view/pages/splash_page/splash_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: MainPage, children: [
      AutoRoute(
        path: "home-tab",
        name: "HomeTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: HomePage),
        ],
      ),
      AutoRoute(
        path: "my-profile-tab",
        name: "MyProfileTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: MyProfilePage),
        ],
      )
    ]),
  ],
)
class $AppRouter {}
