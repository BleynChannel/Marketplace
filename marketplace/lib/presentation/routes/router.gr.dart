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
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i19;

import '../../domain/entity/filter.dart' as _i20;
import '../pages/cart_page.dart' as _i5;
import '../pages/debug_page.dart' as _i1;
import '../pages/desired_page.dart' as _i14;
import '../pages/discover_page.dart' as _i13;
import '../pages/filter_page.dart' as _i17;
import '../pages/home_page.dart' as _i4;
import '../pages/login_page.dart' as _i9;
import '../pages/login_with_email_page.dart' as _i10;
import '../pages/menu_page.dart' as _i15;
import '../pages/notification_page.dart' as _i6;
import '../pages/product_page.dart' as _i8;
import '../pages/profile_page.dart' as _i7;
import '../pages/reset_password_page.dart' as _i12;
import '../pages/search_page.dart' as _i16;
import '../pages/signup_page.dart' as _i11;
import '../pages/welcome_page.dart' as _i2;

class AppRouter extends _i18.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    DebugRoute.name: (routeData) {
      final args = routeData.argsAs<DebugRouteArgs>(
          orElse: () => const DebugRouteArgs());
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.DebugPage(key: args.key),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
      );
    },
    AuthEmpty.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.HomePage(key: args.key),
      );
    },
    CartRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CartPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.NotificationPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => ProfileRouteArgs(id: pathParams.getString('id')));
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.ProfilePage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ProductRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductRouteArgs>(
          orElse: () => ProductRouteArgs(id: pathParams.getString('id')));
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ProductPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.LoginPage(key: args.key),
      );
    },
    LoginWithEmailRoute.name: (routeData) {
      final args = routeData.argsAs<LoginWithEmailRouteArgs>(
          orElse: () => const LoginWithEmailRouteArgs());
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.LoginWithEmailPage(key: args.key),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.SignUpPage(key: args.key),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>(
          orElse: () => const ResetPasswordRouteArgs());
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.ResetPasswordPage(key: args.key),
      );
    },
    DiscoverRoute.name: (routeData) {
      final args = routeData.argsAs<DiscoverRouteArgs>(
          orElse: () => const DiscoverRouteArgs());
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.DiscoverPage(key: args.key),
      );
    },
    SearchEmpty.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    DesiredRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.DesiredPage(),
      );
    },
    MenuRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MenuRouteArgs>(
          orElse: () => MenuRouteArgs(path: pathParams.optString('path')));
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.MenuPage(
          key: args.key,
          path: args.path,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.SearchPage(
          key: args.key,
          filter: args.filter,
        ),
      );
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.FilterPage(
          key: args.key,
          filter: args.filter,
        ),
      );
    },
  };

  @override
  List<_i18.RouteConfig> get routes => [
        _i18.RouteConfig(
          DebugRoute.name,
          path: '/',
        ),
        _i18.RouteConfig(
          WelcomeRoute.name,
          path: '/welcome',
        ),
        _i18.RouteConfig(
          AuthEmpty.name,
          path: '/auth',
          children: [
            _i18.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthEmpty.name,
            ),
            _i18.RouteConfig(
              LoginWithEmailRoute.name,
              path: 'email',
              parent: AuthEmpty.name,
            ),
            _i18.RouteConfig(
              SignUpRoute.name,
              path: 'signup',
              parent: AuthEmpty.name,
            ),
            _i18.RouteConfig(
              ResetPasswordRoute.name,
              path: 'reset_password',
              parent: AuthEmpty.name,
            ),
          ],
        ),
        _i18.RouteConfig(
          HomeRoute.name,
          path: '/home',
          children: [
            _i18.RouteConfig(
              DiscoverRoute.name,
              path: 'discover',
              parent: HomeRoute.name,
            ),
            _i18.RouteConfig(
              SearchEmpty.name,
              path: 'search',
              parent: HomeRoute.name,
              children: [
                _i18.RouteConfig(
                  SearchRoute.name,
                  path: '',
                  parent: SearchEmpty.name,
                ),
                _i18.RouteConfig(
                  FilterRoute.name,
                  path: 'filter',
                  parent: SearchEmpty.name,
                ),
              ],
            ),
            _i18.RouteConfig(
              DesiredRoute.name,
              path: 'desired',
              parent: HomeRoute.name,
            ),
            _i18.RouteConfig(
              MenuRoute.name,
              path: 'menu/:path',
              parent: HomeRoute.name,
            ),
          ],
        ),
        _i18.RouteConfig(
          CartRoute.name,
          path: '/cart',
        ),
        _i18.RouteConfig(
          NotificationRoute.name,
          path: '/notification',
        ),
        _i18.RouteConfig(
          ProfileRoute.name,
          path: '/profile/:id',
        ),
        _i18.RouteConfig(
          ProductRoute.name,
          path: '/product/:id',
        ),
      ];
}

/// generated route for
/// [_i1.DebugPage]
class DebugRoute extends _i18.PageRouteInfo<DebugRouteArgs> {
  DebugRoute({_i19.Key? key})
      : super(
          DebugRoute.name,
          path: '/',
          args: DebugRouteArgs(key: key),
        );

  static const String name = 'DebugRoute';
}

class DebugRouteArgs {
  const DebugRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'DebugRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomeRoute extends _i18.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/welcome',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class AuthEmpty extends _i18.PageRouteInfo<void> {
  const AuthEmpty({List<_i18.PageRouteInfo>? children})
      : super(
          AuthEmpty.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthEmpty';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i18.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
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

  final _i19.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.CartPage]
class CartRoute extends _i18.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i6.NotificationPage]
class NotificationRoute extends _i18.PageRouteInfo<void> {
  const NotificationRoute()
      : super(
          NotificationRoute.name,
          path: '/notification',
        );

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i18.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i19.Key? key,
    required String id,
  }) : super(
          ProfileRoute.name,
          path: '/profile/:id',
          args: ProfileRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.id,
  });

  final _i19.Key? key;

  final String id;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i8.ProductPage]
class ProductRoute extends _i18.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i19.Key? key,
    required String id,
  }) : super(
          ProductRoute.name,
          path: '/product/:id',
          args: ProductRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.id,
  });

  final _i19.Key? key;

  final String id;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i18.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i19.Key? key})
      : super(
          LoginRoute.name,
          path: 'login',
          args: LoginRouteArgs(key: key),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.LoginWithEmailPage]
class LoginWithEmailRoute extends _i18.PageRouteInfo<LoginWithEmailRouteArgs> {
  LoginWithEmailRoute({_i19.Key? key})
      : super(
          LoginWithEmailRoute.name,
          path: 'email',
          args: LoginWithEmailRouteArgs(key: key),
        );

  static const String name = 'LoginWithEmailRoute';
}

class LoginWithEmailRouteArgs {
  const LoginWithEmailRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'LoginWithEmailRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.SignUpPage]
class SignUpRoute extends _i18.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({_i19.Key? key})
      : super(
          SignUpRoute.name,
          path: 'signup',
          args: SignUpRouteArgs(key: key),
        );

  static const String name = 'SignUpRoute';
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.ResetPasswordPage]
class ResetPasswordRoute extends _i18.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({_i19.Key? key})
      : super(
          ResetPasswordRoute.name,
          path: 'reset_password',
          args: ResetPasswordRouteArgs(key: key),
        );

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.DiscoverPage]
class DiscoverRoute extends _i18.PageRouteInfo<DiscoverRouteArgs> {
  DiscoverRoute({_i19.Key? key})
      : super(
          DiscoverRoute.name,
          path: 'discover',
          args: DiscoverRouteArgs(key: key),
        );

  static const String name = 'DiscoverRoute';
}

class DiscoverRouteArgs {
  const DiscoverRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'DiscoverRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.EmptyRouterPage]
class SearchEmpty extends _i18.PageRouteInfo<void> {
  const SearchEmpty({List<_i18.PageRouteInfo>? children})
      : super(
          SearchEmpty.name,
          path: 'search',
          initialChildren: children,
        );

  static const String name = 'SearchEmpty';
}

/// generated route for
/// [_i14.DesiredPage]
class DesiredRoute extends _i18.PageRouteInfo<void> {
  const DesiredRoute()
      : super(
          DesiredRoute.name,
          path: 'desired',
        );

  static const String name = 'DesiredRoute';
}

/// generated route for
/// [_i15.MenuPage]
class MenuRoute extends _i18.PageRouteInfo<MenuRouteArgs> {
  MenuRoute({
    _i19.Key? key,
    String? path,
  }) : super(
          MenuRoute.name,
          path: 'menu/:path',
          args: MenuRouteArgs(
            key: key,
            path: path,
          ),
          rawPathParams: {'path': path},
        );

  static const String name = 'MenuRoute';
}

class MenuRouteArgs {
  const MenuRouteArgs({
    this.key,
    this.path,
  });

  final _i19.Key? key;

  final String? path;

  @override
  String toString() {
    return 'MenuRouteArgs{key: $key, path: $path}';
  }
}

/// generated route for
/// [_i16.SearchPage]
class SearchRoute extends _i18.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i19.Key? key,
    _i20.Filter? filter,
  }) : super(
          SearchRoute.name,
          path: '',
          args: SearchRouteArgs(
            key: key,
            filter: filter,
          ),
        );

  static const String name = 'SearchRoute';
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    this.filter,
  });

  final _i19.Key? key;

  final _i20.Filter? filter;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, filter: $filter}';
  }
}

/// generated route for
/// [_i17.FilterPage]
class FilterRoute extends _i18.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    _i19.Key? key,
    required _i20.Filter filter,
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

  final _i19.Key? key;

  final _i20.Filter filter;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, filter: $filter}';
  }
}
