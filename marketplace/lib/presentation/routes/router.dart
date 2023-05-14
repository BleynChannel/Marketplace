import 'package:auto_route/auto_route.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';

@RoutePage(name: 'EmptyRouter')
class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({super.key});
}

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: DebugRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/welcome',
          page: WelcomeRoute.page,
        ),
        AutoRoute(
          path: '/auth',
          page: EmptyRouter.page,
          children: [
            AutoRoute(
              path: 'login',
              page: LoginRoute.page,
            ),
            AutoRoute(
              path: 'email',
              page: LoginWithEmailRoute.page,
            ),
            AutoRoute(
              path: 'signup',
              page: SignUpRoute.page,
            ),
            AutoRoute(
              path: 'reset_password',
              page: ResetPasswordRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
          children: [
            AutoRoute(
              path: 'discover',
              page: DiscoverRoute.page,
            ),
            AutoRoute(path: 'search', page: EmptyRouter.page, children: [
              AutoRoute(
                path: '',
                page: SearchRoute.page,
              ),
              AutoRoute(
                path: 'filter',
                page: FilterRoute.page,
              )
            ]),
            AutoRoute(
              path: 'desired',
              page: DesiredRoute.page,
            ),
            AutoRoute(
              path: 'menu/:path',
              page: MenuRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/cart',
          page: CartRoute.page,
        ),
        AutoRoute(
          path: '/notification',
          page: NotificationRoute.page,
        ),
        AutoRoute(
          path: '/profile/:id',
          page: ProfileRoute.page,
        ),
        AutoRoute(
          path: '/product/:id',
          page: ProductRoute.page,
        ),
      ];
}
