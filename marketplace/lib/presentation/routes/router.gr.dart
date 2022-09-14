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
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/foundation.dart' as _i16;
import 'package:flutter/material.dart' as _i15;

import '../pages/cart_page.dart' as _i5;
import '../pages/desired_page.dart' as _i12;
import '../pages/discover_page.dart' as _i10;
import '../pages/home_page.dart' as _i4;
import '../pages/login_page.dart' as _i8;
import '../pages/login_with_email_page.dart' as _i9;
import '../pages/menu_page.dart' as _i13;
import '../pages/notification_page.dart' as _i6;
import '../pages/profile_page.dart' as _i7;
import '../pages/search_page.dart' as _i11;
import '../pages/signup_page.dart' as _i3;
import '../pages/welcome_page.dart' as _i1;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.WelcomePage());
    },
    EmptyRouterPageRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    SignUpRouth.name: (routeData) {
      final args = routeData.argsAs<SignUpRouthArgs>(
          orElse: () => const SignUpRouthArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.SignUpPage(key: args.key));
    },
    HomeRouth.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouthArgs>(orElse: () => const HomeRouthArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.HomePage(key: args.key));
    },
    CartRouth.name: (routeData) {
      final args =
          routeData.argsAs<CartRouthArgs>(orElse: () => const CartRouthArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.CartPage(key: args.key));
    },
    NotificationRouth.name: (routeData) {
      final args = routeData.argsAs<NotificationRouthArgs>(
          orElse: () => const NotificationRouthArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.NotificationPage(key: args.key));
    },
    ProfileRouth.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ProfilePage());
    },
    LoginRouth.name: (routeData) {
      final args = routeData.argsAs<LoginRouthArgs>(
          orElse: () => const LoginRouthArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.LoginPage(key: args.key));
    },
    LogWithEmailRouth.name: (routeData) {
      final args = routeData.argsAs<LogWithEmailRouthArgs>(
          orElse: () => const LogWithEmailRouthArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.LogWithEmailPage(key: args.key));
    },
    DiscoverRouth.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.DiscoverPage());
    },
    SearchRouth.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SearchPage());
    },
    DesiredRouth.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.DesiredPage());
    },
    MenuRouth.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.MenuPage());
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig('/#redirect',
            path: '/', redirectTo: '/welcome', fullMatch: true),
        _i14.RouteConfig(WelcomeRoute.name, path: '/welcome'),
        _i14.RouteConfig(EmptyRouterPageRoute.name, path: '/login', children: [
          _i14.RouteConfig(LoginRouth.name,
              path: '', parent: EmptyRouterPageRoute.name),
          _i14.RouteConfig(LogWithEmailRouth.name,
              path: 'email', parent: EmptyRouterPageRoute.name)
        ]),
        _i14.RouteConfig(SignUpRouth.name, path: '/signup'),
        _i14.RouteConfig(HomeRouth.name, path: '/home', children: [
          _i14.RouteConfig('#redirect',
              path: '',
              parent: HomeRouth.name,
              redirectTo: 'discover',
              fullMatch: true),
          _i14.RouteConfig(DiscoverRouth.name,
              path: 'discover', parent: HomeRouth.name),
          _i14.RouteConfig(SearchRouth.name,
              path: 'search', parent: HomeRouth.name),
          _i14.RouteConfig(DesiredRouth.name,
              path: 'desired', parent: HomeRouth.name),
          _i14.RouteConfig(MenuRouth.name, path: 'menu', parent: HomeRouth.name)
        ]),
        _i14.RouteConfig(CartRouth.name, path: '/cart'),
        _i14.RouteConfig(NotificationRouth.name, path: '/notification'),
        _i14.RouteConfig(ProfileRouth.name, path: '/profile')
      ];
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomeRoute extends _i14.PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: '/welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class EmptyRouterPageRoute extends _i14.PageRouteInfo<void> {
  const EmptyRouterPageRoute({List<_i14.PageRouteInfo>? children})
      : super(EmptyRouterPageRoute.name,
            path: '/login', initialChildren: children);

  static const String name = 'EmptyRouterPageRoute';
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRouth extends _i14.PageRouteInfo<SignUpRouthArgs> {
  SignUpRouth({_i16.Key? key})
      : super(SignUpRouth.name,
            path: '/signup', args: SignUpRouthArgs(key: key));

  static const String name = 'SignUpRouth';
}

class SignUpRouthArgs {
  const SignUpRouthArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'SignUpRouthArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRouth extends _i14.PageRouteInfo<HomeRouthArgs> {
  HomeRouth({_i16.Key? key, List<_i14.PageRouteInfo>? children})
      : super(HomeRouth.name,
            path: '/home',
            args: HomeRouthArgs(key: key),
            initialChildren: children);

  static const String name = 'HomeRouth';
}

class HomeRouthArgs {
  const HomeRouthArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'HomeRouthArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.CartPage]
class CartRouth extends _i14.PageRouteInfo<CartRouthArgs> {
  CartRouth({_i16.Key? key})
      : super(CartRouth.name, path: '/cart', args: CartRouthArgs(key: key));

  static const String name = 'CartRouth';
}

class CartRouthArgs {
  const CartRouthArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'CartRouthArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.NotificationPage]
class NotificationRouth extends _i14.PageRouteInfo<NotificationRouthArgs> {
  NotificationRouth({_i16.Key? key})
      : super(NotificationRouth.name,
            path: '/notification', args: NotificationRouthArgs(key: key));

  static const String name = 'NotificationRouth';
}

class NotificationRouthArgs {
  const NotificationRouthArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'NotificationRouthArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRouth extends _i14.PageRouteInfo<void> {
  const ProfileRouth() : super(ProfileRouth.name, path: '/profile');

  static const String name = 'ProfileRouth';
}

/// generated route for
/// [_i8.LoginPage]
class LoginRouth extends _i14.PageRouteInfo<LoginRouthArgs> {
  LoginRouth({_i16.Key? key})
      : super(LoginRouth.name, path: '', args: LoginRouthArgs(key: key));

  static const String name = 'LoginRouth';
}

class LoginRouthArgs {
  const LoginRouthArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'LoginRouthArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.LogWithEmailPage]
class LogWithEmailRouth extends _i14.PageRouteInfo<LogWithEmailRouthArgs> {
  LogWithEmailRouth({_i16.Key? key})
      : super(LogWithEmailRouth.name,
            path: 'email', args: LogWithEmailRouthArgs(key: key));

  static const String name = 'LogWithEmailRouth';
}

class LogWithEmailRouthArgs {
  const LogWithEmailRouthArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'LogWithEmailRouthArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.DiscoverPage]
class DiscoverRouth extends _i14.PageRouteInfo<void> {
  const DiscoverRouth() : super(DiscoverRouth.name, path: 'discover');

  static const String name = 'DiscoverRouth';
}

/// generated route for
/// [_i11.SearchPage]
class SearchRouth extends _i14.PageRouteInfo<void> {
  const SearchRouth() : super(SearchRouth.name, path: 'search');

  static const String name = 'SearchRouth';
}

/// generated route for
/// [_i12.DesiredPage]
class DesiredRouth extends _i14.PageRouteInfo<void> {
  const DesiredRouth() : super(DesiredRouth.name, path: 'desired');

  static const String name = 'DesiredRouth';
}

/// generated route for
/// [_i13.MenuPage]
class MenuRouth extends _i14.PageRouteInfo<void> {
  const MenuRouth() : super(MenuRouth.name, path: 'menu');

  static const String name = 'MenuRouth';
}
