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
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i18;

import '../../domain/entity/filter.dart' as _i19;
import '../pages/cart_page.dart' as _i4;
import '../pages/desired_page.dart' as _i13;
import '../pages/discover_page.dart' as _i12;
import '../pages/filter_page.dart' as _i16;
import '../pages/home_page.dart' as _i3;
import '../pages/login_page.dart' as _i8;
import '../pages/login_with_email_page.dart' as _i9;
import '../pages/menu_page.dart' as _i14;
import '../pages/notification_page.dart' as _i5;
import '../pages/product_page.dart' as _i7;
import '../pages/profile_page.dart' as _i6;
import '../pages/reset_password_page.dart' as _i11;
import '../pages/search_page.dart' as _i15;
import '../pages/signup_page.dart' as _i10;
import '../pages/welcome_page.dart' as _i1;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.WelcomePage(),
      );
    },
    AuthEmpty.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(key: args.key),
      );
    },
    CartRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.CartPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationRouteArgs>(
          orElse: () => const NotificationRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.NotificationPage(key: args.key),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ProfilePage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    ProductRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductRouteArgs>(
          orElse: () => ProductRouteArgs(id: pathParams.getString('id')));
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.ProductPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.LoginPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    LoginWithEmailRoute.name: (routeData) {
      final args = routeData.argsAs<LoginWithEmailRouteArgs>(
          orElse: () => const LoginWithEmailRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.LoginWithEmailPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.SignUpPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>(
          orElse: () => const ResetPasswordRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.ResetPasswordPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    DiscoverRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.DiscoverPage(),
      );
    },
    SearchEmpty.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    DesiredRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.DesiredPage(),
      );
    },
    MenuRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MenuRouteArgs>(
          orElse: () => MenuRouteArgs(path: pathParams.optString('path')));
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.MenuPage(
          key: args.key,
          path: args.path,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.SearchPage(
          key: args.key,
          filter: args.filter,
        ),
      );
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.FilterPage(
          key: args.key,
          filter: args.filter,
        ),
      );
    },
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(
          WelcomeRoute.name,
          path: '/welcome',
        ),
        _i17.RouteConfig(
          AuthEmpty.name,
          path: '/auth',
          children: [
            _i17.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthEmpty.name,
            ),
            _i17.RouteConfig(
              LoginWithEmailRoute.name,
              path: 'email',
              parent: AuthEmpty.name,
            ),
            _i17.RouteConfig(
              SignUpRoute.name,
              path: 'signup',
              parent: AuthEmpty.name,
            ),
            _i17.RouteConfig(
              ResetPasswordRoute.name,
              path: 'reset_password',
              parent: AuthEmpty.name,
            ),
          ],
        ),
        _i17.RouteConfig(
          HomeRoute.name,
          path: '/home',
          children: [
            _i17.RouteConfig(
              DiscoverRoute.name,
              path: 'discover',
              parent: HomeRoute.name,
            ),
            _i17.RouteConfig(
              SearchEmpty.name,
              path: 'search',
              parent: HomeRoute.name,
              children: [
                _i17.RouteConfig(
                  SearchRoute.name,
                  path: '',
                  parent: SearchEmpty.name,
                ),
                _i17.RouteConfig(
                  FilterRoute.name,
                  path: 'filter',
                  parent: SearchEmpty.name,
                ),
              ],
            ),
            _i17.RouteConfig(
              DesiredRoute.name,
              path: 'desired',
              parent: HomeRoute.name,
            ),
            _i17.RouteConfig(
              MenuRoute.name,
              path: 'menu/:path',
              parent: HomeRoute.name,
            ),
          ],
        ),
        _i17.RouteConfig(
          CartRoute.name,
          path: '/cart',
        ),
        _i17.RouteConfig(
          NotificationRoute.name,
          path: '/notification',
        ),
        _i17.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i17.RouteConfig(
          ProductRoute.name,
          path: '/product/:id',
        ),
      ];
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomeRoute extends _i17.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/welcome',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class AuthEmpty extends _i17.PageRouteInfo<void> {
  const AuthEmpty({List<_i17.PageRouteInfo>? children})
      : super(
          AuthEmpty.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthEmpty';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i17.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
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

  final _i18.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CartPage]
class CartRoute extends _i17.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i5.NotificationPage]
class NotificationRoute extends _i17.PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({_i18.Key? key})
      : super(
          NotificationRoute.name,
          path: '/notification',
          args: NotificationRouteArgs(key: key),
        );

  static const String name = 'NotificationRoute';
}

class NotificationRouteArgs {
  const NotificationRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'NotificationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i17.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i18.Key? key,
    String? userId,
  }) : super(
          ProfileRoute.name,
          path: '/profile',
          args: ProfileRouteArgs(
            key: key,
            userId: userId,
          ),
        );

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.userId,
  });

  final _i18.Key? key;

  final String? userId;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i7.ProductPage]
class ProductRoute extends _i17.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i18.Key? key,
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

  final _i18.Key? key;

  final String id;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i17.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i18.Key? key,
    String? email,
  }) : super(
          LoginRoute.name,
          path: 'login',
          args: LoginRouteArgs(
            key: key,
            email: email,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.email,
  });

  final _i18.Key? key;

  final String? email;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i9.LoginWithEmailPage]
class LoginWithEmailRoute extends _i17.PageRouteInfo<LoginWithEmailRouteArgs> {
  LoginWithEmailRoute({
    _i18.Key? key,
    String? email,
  }) : super(
          LoginWithEmailRoute.name,
          path: 'email',
          args: LoginWithEmailRouteArgs(
            key: key,
            email: email,
          ),
        );

  static const String name = 'LoginWithEmailRoute';
}

class LoginWithEmailRouteArgs {
  const LoginWithEmailRouteArgs({
    this.key,
    this.email,
  });

  final _i18.Key? key;

  final String? email;

  @override
  String toString() {
    return 'LoginWithEmailRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i10.SignUpPage]
class SignUpRoute extends _i17.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i18.Key? key,
    String? email,
  }) : super(
          SignUpRoute.name,
          path: 'signup',
          args: SignUpRouteArgs(
            key: key,
            email: email,
          ),
        );

  static const String name = 'SignUpRoute';
}

class SignUpRouteArgs {
  const SignUpRouteArgs({
    this.key,
    this.email,
  });

  final _i18.Key? key;

  final String? email;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i11.ResetPasswordPage]
class ResetPasswordRoute extends _i17.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i18.Key? key,
    String? email,
  }) : super(
          ResetPasswordRoute.name,
          path: 'reset_password',
          args: ResetPasswordRouteArgs(
            key: key,
            email: email,
          ),
        );

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    this.key,
    this.email,
  });

  final _i18.Key? key;

  final String? email;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i12.DiscoverPage]
class DiscoverRoute extends _i17.PageRouteInfo<void> {
  const DiscoverRoute()
      : super(
          DiscoverRoute.name,
          path: 'discover',
        );

  static const String name = 'DiscoverRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SearchEmpty extends _i17.PageRouteInfo<void> {
  const SearchEmpty({List<_i17.PageRouteInfo>? children})
      : super(
          SearchEmpty.name,
          path: 'search',
          initialChildren: children,
        );

  static const String name = 'SearchEmpty';
}

/// generated route for
/// [_i13.DesiredPage]
class DesiredRoute extends _i17.PageRouteInfo<void> {
  const DesiredRoute()
      : super(
          DesiredRoute.name,
          path: 'desired',
        );

  static const String name = 'DesiredRoute';
}

/// generated route for
/// [_i14.MenuPage]
class MenuRoute extends _i17.PageRouteInfo<MenuRouteArgs> {
  MenuRoute({
    _i18.Key? key,
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

  final _i18.Key? key;

  final String? path;

  @override
  String toString() {
    return 'MenuRouteArgs{key: $key, path: $path}';
  }
}

/// generated route for
/// [_i15.SearchPage]
class SearchRoute extends _i17.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i18.Key? key,
    _i19.Filter? filter,
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

  final _i18.Key? key;

  final _i19.Filter? filter;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, filter: $filter}';
  }
}

/// generated route for
/// [_i16.FilterPage]
class FilterRoute extends _i17.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    _i18.Key? key,
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

  final _i18.Key? key;

  final _i19.Filter filter;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, filter: $filter}';
  }
}
