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
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i17;

import '../../domain/entity/compact_product.dart' as _i18;
import '../../domain/entity/filter.dart' as _i19;
import '../pages/cart_page.dart' as _i5;
import '../pages/desired_page.dart' as _i12;
import '../pages/discover_page.dart' as _i11;
import '../pages/filter_page.dart' as _i15;
import '../pages/home_page.dart' as _i4;
import '../pages/login_page.dart' as _i9;
import '../pages/login_with_email_page.dart' as _i10;
import '../pages/menu_page.dart' as _i13;
import '../pages/notification_page.dart' as _i6;
import '../pages/product_page.dart' as _i8;
import '../pages/profile_page.dart' as _i7;
import '../pages/search_page.dart' as _i14;
import '../pages/signup_page.dart' as _i3;
import '../pages/welcome_page.dart' as _i1;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.WelcomePage(),
      );
    },
    LoginEmpty.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.HomePage(key: args.key),
      );
    },
    CartRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CartPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationRouteArgs>(
          orElse: () => const NotificationRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.NotificationPage(key: args.key),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ProductPage(
          key: args.key,
          compactProduct: args.compactProduct,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.LoginPage(key: args.key),
      );
    },
    LoginWithEmailRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.LoginWithEmailPage(),
      );
    },
    DiscoverRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.DiscoverPage(),
      );
    },
    SearchEmpty.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    DesiredRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.DesiredPage(),
      );
    },
    MenuRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.MenuPage(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.SearchPage(key: args.key),
      );
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.FilterPage(
          key: args.key,
          filter: args.filter,
        ),
      );
    },
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/welcome',
          fullMatch: true,
        ),
        _i16.RouteConfig(
          WelcomeRoute.name,
          path: '/welcome',
        ),
        _i16.RouteConfig(
          LoginEmpty.name,
          path: '/login',
          children: [
            _i16.RouteConfig(
              LoginRoute.name,
              path: '',
              parent: LoginEmpty.name,
            ),
            _i16.RouteConfig(
              LoginWithEmailRoute.name,
              path: 'email',
              parent: LoginEmpty.name,
            ),
          ],
        ),
        _i16.RouteConfig(
          SignUpRoute.name,
          path: '/signup',
        ),
        _i16.RouteConfig(
          HomeRoute.name,
          path: '/home',
          children: [
            _i16.RouteConfig(
              DiscoverRoute.name,
              path: 'discover',
              parent: HomeRoute.name,
            ),
            _i16.RouteConfig(
              SearchEmpty.name,
              path: 'search',
              parent: HomeRoute.name,
              children: [
                _i16.RouteConfig(
                  SearchRoute.name,
                  path: '',
                  parent: SearchEmpty.name,
                ),
                _i16.RouteConfig(
                  FilterRoute.name,
                  path: 'filter',
                  parent: SearchEmpty.name,
                ),
              ],
            ),
            _i16.RouteConfig(
              DesiredRoute.name,
              path: 'desired',
              parent: HomeRoute.name,
            ),
            _i16.RouteConfig(
              MenuRoute.name,
              path: 'menu',
              parent: HomeRoute.name,
            ),
          ],
        ),
        _i16.RouteConfig(
          CartRoute.name,
          path: '/cart',
        ),
        _i16.RouteConfig(
          NotificationRoute.name,
          path: '/notification',
        ),
        _i16.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i16.RouteConfig(
          ProductRoute.name,
          path: '/product',
        ),
      ];
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomeRoute extends _i16.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/welcome',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class LoginEmpty extends _i16.PageRouteInfo<void> {
  const LoginEmpty({List<_i16.PageRouteInfo>? children})
      : super(
          LoginEmpty.name,
          path: '/login',
          initialChildren: children,
        );

  static const String name = 'LoginEmpty';
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i16.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i16.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          path: '/home',
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

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
class CartRoute extends _i16.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i6.NotificationPage]
class NotificationRoute extends _i16.PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({_i17.Key? key})
      : super(
          NotificationRoute.name,
          path: '/notification',
          args: NotificationRouteArgs(key: key),
        );

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
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i8.ProductPage]
class ProductRoute extends _i16.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i17.Key? key,
    required _i18.CompactProduct compactProduct,
  }) : super(
          ProductRoute.name,
          path: '/product',
          args: ProductRouteArgs(
            key: key,
            compactProduct: compactProduct,
          ),
        );

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.compactProduct,
  });

  final _i17.Key? key;

  final _i18.CompactProduct compactProduct;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, compactProduct: $compactProduct}';
  }
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i17.Key? key})
      : super(
          LoginRoute.name,
          path: '',
          args: LoginRouteArgs(key: key),
        );

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
/// [_i10.LoginWithEmailPage]
class LoginWithEmailRoute extends _i16.PageRouteInfo<void> {
  const LoginWithEmailRoute()
      : super(
          LoginWithEmailRoute.name,
          path: 'email',
        );

  static const String name = 'LoginWithEmailRoute';
}

/// generated route for
/// [_i11.DiscoverPage]
class DiscoverRoute extends _i16.PageRouteInfo<void> {
  const DiscoverRoute()
      : super(
          DiscoverRoute.name,
          path: 'discover',
        );

  static const String name = 'DiscoverRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SearchEmpty extends _i16.PageRouteInfo<void> {
  const SearchEmpty({List<_i16.PageRouteInfo>? children})
      : super(
          SearchEmpty.name,
          path: 'search',
          initialChildren: children,
        );

  static const String name = 'SearchEmpty';
}

/// generated route for
/// [_i12.DesiredPage]
class DesiredRoute extends _i16.PageRouteInfo<void> {
  const DesiredRoute()
      : super(
          DesiredRoute.name,
          path: 'desired',
        );

  static const String name = 'DesiredRoute';
}

/// generated route for
/// [_i13.MenuPage]
class MenuRoute extends _i16.PageRouteInfo<void> {
  const MenuRoute()
      : super(
          MenuRoute.name,
          path: 'menu',
        );

  static const String name = 'MenuRoute';
}

/// generated route for
/// [_i14.SearchPage]
class SearchRoute extends _i16.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({_i17.Key? key})
      : super(
          SearchRoute.name,
          path: '',
          args: SearchRouteArgs(key: key),
        );

  static const String name = 'SearchRoute';
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.FilterPage]
class FilterRoute extends _i16.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    _i17.Key? key,
    required _i19.Filter filter,
  }) : super(
          FilterRoute.name,
          path: 'filter',
          args: FilterRouteArgs(
            key: key,
            filter: filter,
          ),
        );

  static const String name = 'FilterRoute';
}

class FilterRouteArgs {
  const FilterRouteArgs({
    this.key,
    required this.filter,
  });

  final _i17.Key? key;

  final _i19.Filter filter;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, filter: $filter}';
  }
}
