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
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/foundation.dart' as _i17;
import 'package:flutter/material.dart' as _i16;

import '../../domain/entity/filter.dart' as _i18;
import '../pages/cart_page.dart' as _i5;
import '../pages/desired_page.dart' as _i11;
import '../pages/discover_page.dart' as _i10;
import '../pages/filter_page.dart' as _i14;
import '../pages/home_page.dart' as _i4;
import '../pages/login_page.dart' as _i8;
import '../pages/login_with_email_page.dart' as _i9;
import '../pages/menu_page.dart' as _i12;
import '../pages/notification_page.dart' as _i6;
import '../pages/profile_page.dart' as _i7;
import '../pages/search_page.dart' as _i13;
import '../pages/signup_page.dart' as _i3;
import '../pages/welcome_page.dart' as _i1;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.WelcomePage());
    },
    LoginEmpty.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.SignUpPage(key: args.key));
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.HomePage(key: args.key));
    },
    CartRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CartPage());
    },
    NotificationRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationRouteArgs>(
          orElse: () => const NotificationRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.NotificationPage(key: args.key));
    },
    ProfileRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ProfilePage());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.LoginPage(key: args.key));
    },
    LogWithEmailRoute.name: (routeData) {
      final args = routeData.argsAs<LogWithEmailRouteArgs>(
          orElse: () => const LogWithEmailRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.LogWithEmailPage(key: args.key));
    },
    DiscoverRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.DiscoverPage());
    },
    SearchEmpty.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    DesiredRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.DesiredPage());
    },
    MenuRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.MenuPage());
    },
    SearchRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.SearchPage());
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.FilterPage(key: args.key, filter: args.filter));
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig('/#redirect',
            path: '/', redirectTo: '/welcome', fullMatch: true),
        _i15.RouteConfig(WelcomeRoute.name, path: '/welcome'),
        _i15.RouteConfig(LoginEmpty.name, path: '/login', children: [
          _i15.RouteConfig(LoginRoute.name, path: '', parent: LoginEmpty.name),
          _i15.RouteConfig(LogWithEmailRoute.name,
              path: 'email', parent: LoginEmpty.name)
        ]),
        _i15.RouteConfig(SignUpRoute.name, path: '/signup'),
        _i15.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i15.RouteConfig('#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'discover',
              fullMatch: true),
          _i15.RouteConfig(DiscoverRoute.name,
              path: 'discover', parent: HomeRoute.name),
          _i15.RouteConfig(SearchEmpty.name,
              path: 'search',
              parent: HomeRoute.name,
              children: [
                _i15.RouteConfig(SearchRoute.name,
                    path: '', parent: SearchEmpty.name),
                _i15.RouteConfig(FilterRoute.name,
                    path: 'filter', parent: SearchEmpty.name)
              ]),
          _i15.RouteConfig(DesiredRoute.name,
              path: 'desired', parent: HomeRoute.name),
          _i15.RouteConfig(MenuRoute.name, path: 'menu', parent: HomeRoute.name)
        ]),
        _i15.RouteConfig(CartRoute.name, path: '/cart'),
        _i15.RouteConfig(NotificationRoute.name, path: '/notification'),
        _i15.RouteConfig(ProfileRoute.name, path: '/profile')
      ];
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomeRoute extends _i15.PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: '/welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class LoginEmpty extends _i15.PageRouteInfo<void> {
  const LoginEmpty({List<_i15.PageRouteInfo>? children})
      : super(LoginEmpty.name, path: '/login', initialChildren: children);

  static const String name = 'LoginEmpty';
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i15.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({_i17.Key? key})
      : super(SignUpRoute.name,
            path: '/signup', args: SignUpRouteArgs(key: key));

  static const String name = 'SignUpRoute';
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i15.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i17.Key? key, List<_i15.PageRouteInfo>? children})
      : super(HomeRoute.name,
            path: '/home',
            args: HomeRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.CartPage]
class CartRoute extends _i15.PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '/cart');

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i6.NotificationPage]
class NotificationRoute extends _i15.PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({_i17.Key? key})
      : super(NotificationRoute.name,
            path: '/notification', args: NotificationRouteArgs(key: key));

  static const String name = 'NotificationRoute';
}

class NotificationRouteArgs {
  const NotificationRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'NotificationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i17.Key? key})
      : super(LoginRoute.name, path: '', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.LogWithEmailPage]
class LogWithEmailRoute extends _i15.PageRouteInfo<LogWithEmailRouteArgs> {
  LogWithEmailRoute({_i17.Key? key})
      : super(LogWithEmailRoute.name,
            path: 'email', args: LogWithEmailRouteArgs(key: key));

  static const String name = 'LogWithEmailRoute';
}

class LogWithEmailRouteArgs {
  const LogWithEmailRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'LogWithEmailRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.DiscoverPage]
class DiscoverRoute extends _i15.PageRouteInfo<void> {
  const DiscoverRoute() : super(DiscoverRoute.name, path: 'discover');

  static const String name = 'DiscoverRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SearchEmpty extends _i15.PageRouteInfo<void> {
  const SearchEmpty({List<_i15.PageRouteInfo>? children})
      : super(SearchEmpty.name, path: 'search', initialChildren: children);

  static const String name = 'SearchEmpty';
}

/// generated route for
/// [_i11.DesiredPage]
class DesiredRoute extends _i15.PageRouteInfo<void> {
  const DesiredRoute() : super(DesiredRoute.name, path: 'desired');

  static const String name = 'DesiredRoute';
}

/// generated route for
/// [_i12.MenuPage]
class MenuRoute extends _i15.PageRouteInfo<void> {
  const MenuRoute() : super(MenuRoute.name, path: 'menu');

  static const String name = 'MenuRoute';
}

/// generated route for
/// [_i13.SearchPage]
class SearchRoute extends _i15.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i14.FilterPage]
class FilterRoute extends _i15.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({_i17.Key? key, required _i18.Filter filter})
      : super(FilterRoute.name,
            path: 'filter', args: FilterRouteArgs(key: key, filter: filter));

  static const String name = 'FilterRoute';
}

class FilterRouteArgs {
  const FilterRouteArgs({this.key, required this.filter});

  final _i17.Key? key;

  final _i18.Filter filter;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, filter: $filter}';
  }
}
