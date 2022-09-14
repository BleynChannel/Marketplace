import 'package:auto_route/annotations.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:marketplace/presentation/pages/cart_page.dart';
import 'package:marketplace/presentation/pages/desired_page.dart';
import 'package:marketplace/presentation/pages/discover_page.dart';
import 'package:marketplace/presentation/pages/home_page.dart';
import 'package:marketplace/presentation/pages/login_page.dart';
import 'package:marketplace/presentation/pages/login_with_email_page.dart';
import 'package:marketplace/presentation/pages/menu_page.dart';
import 'package:marketplace/presentation/pages/notification_page.dart';
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
      //Debug
      initial: true,
    ),
    AutoRoute(
      path: '/login',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: '',
          name: 'LoginRouth',
          page: LoginPage,
        ),
        AutoRoute(
          path: 'email',
          name: 'LogWithEmailRouth',
          page: LogWithEmailPage,
        ),
      ],
    ),
    AutoRoute(
      path: '/signup',
      name: 'SignUpRouth',
      page: SignUpPage,
    ),
    AutoRoute(
      path: '/home',
      name: 'HomeRouth',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'discover',
          name: 'DiscoverRouth',
          page: DiscoverPage,
          initial: true,
        ),
        AutoRoute(
          path: 'search',
          name: 'SearchRouth',
          page: SearchPage,
        ),
        AutoRoute(
          path: 'desired',
          name: 'DesiredRouth',
          page: DesiredPage,
        ),
        AutoRoute(
          path: 'menu',
          name: 'MenuRouth',
          page: MenuPage,
        ),
      ],
    ),
    AutoRoute(
      path: '/cart',
      name: 'CartRouth',
      page: CartPage,
    ),
    AutoRoute(
      path: '/notification',
      name: 'NotificationRouth',
      page: NotificationPage,
    ),
    AutoRoute(
      path: '/profile',
      name: 'ProfileRouth',
      page: ProfilePage,
    ),
  ],
)
class $AppRouter {}