import 'package:auto_route/auto_route.dart';

import '../../app/feature/authentication/authentication.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => .material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SignInRoute.page, initial: true),
    AutoRoute(page: PinCodeRoute.page),
  ];
}
