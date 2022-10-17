import 'package:auto_route/annotations.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:marketplace/presentation/pages/cart_page.dart';
import 'package:marketplace/presentation/pages/desired_page.dart';
import 'package:marketplace/presentation/pages/discover_page.dart';
import 'package:marketplace/presentation/pages/filter_page.dart';
import 'package:marketplace/presentation/pages/home_page.dart';
import 'package:marketplace/presentation/pages/login_page.dart';
import 'package:marketplace/presentation/pages/login_with_email_page.dart';
import 'package:marketplace/presentation/pages/menu_page.dart';
import 'package:marketplace/presentation/pages/notification_page.dart';
import 'package:marketplace/presentation/pages/product_page.dart';
import 'package:marketplace/presentation/pages/profile_page.dart';
import 'package:marketplace/presentation/pages/search_page.dart';
import 'package:marketplace/presentation/pages/signup_page.dart';
import 'package:marketplace/presentation/pages/welcome_page.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(
      path: '/welcome',
      name: 'WelcomeRoute',
      page: WelcomePage,
      //TODO: Менять когда пользователь уже заходил в приложение
      initial: true,
    ),
    AutoRoute(
      path: '/login',
      name: 'LoginEmpty',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: '',
          name: 'LoginRoute',
          page: LoginPage,
        ),
        AutoRoute(
          path: 'email',
          name: 'LogWithEmailRoute',
          page: LogWithEmailPage,
        ),
      ],
    ),
    AutoRoute(
      path: '/signup',
      name: 'SignUpRoute',
      page: SignUpPage,
    ),
    AutoRoute(
      path: '/home',
      name: 'HomeRoute',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'discover',
          name: 'DiscoverRoute',
          page: DiscoverPage,
        ),
        AutoRoute(
            path: 'search',
            name: 'SearchEmpty',
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                path: '',
                name: 'SearchRoute',
                page: SearchPage,
              ),
              AutoRoute(
                path: 'filter',
                name: 'FilterRoute',
                page: FilterPage,
              )
            ]),
        AutoRoute(
          path: 'desired',
          name: 'DesiredRoute',
          page: DesiredPage,
        ),
        AutoRoute(
          path: 'menu',
          name: 'MenuRoute',
          page: MenuPage,
        ),
      ],
    ),
    AutoRoute(
      path: '/cart',
      name: 'CartRoute',
      page: CartPage,
    ),
    AutoRoute(
      path: '/notification',
      name: 'NotificationRoute',
      page: NotificationPage,
    ),
    AutoRoute(
      path: '/profile',
      name: 'ProfileRoute',
      page: ProfilePage,
    ),
    AutoRoute(
      path: '/product',
      name: 'ProductRoute',
      page: ProductPage,
    ),
  ],
)
class $AppRouter {}
