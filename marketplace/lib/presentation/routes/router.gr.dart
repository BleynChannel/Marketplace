// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/foundation.dart' as _i20;
import 'package:flutter/material.dart' as _i19;
import 'package:marketplace/domain/entity/filter.dart' as _i21;
import 'package:marketplace/presentation/pages/cart_page.dart' as _i1;
import 'package:marketplace/presentation/pages/debug_page.dart' as _i2;
import 'package:marketplace/presentation/pages/desired_page.dart' as _i3;
import 'package:marketplace/presentation/pages/discover_page.dart' as _i4;
import 'package:marketplace/presentation/pages/filter_page.dart' as _i5;
import 'package:marketplace/presentation/pages/home_page.dart' as _i6;
import 'package:marketplace/presentation/pages/login_page.dart' as _i7;
import 'package:marketplace/presentation/pages/login_with_email_page.dart'
    as _i8;
import 'package:marketplace/presentation/pages/menu_page.dart' as _i9;
import 'package:marketplace/presentation/pages/notification_page.dart' as _i10;
import 'package:marketplace/presentation/pages/product_page.dart' as _i11;
import 'package:marketplace/presentation/pages/profile_page.dart' as _i12;
import 'package:marketplace/presentation/pages/reset_password_page.dart'
    as _i13;
import 'package:marketplace/presentation/pages/search_page.dart' as _i14;
import 'package:marketplace/presentation/pages/signup_page.dart' as _i15;
import 'package:marketplace/presentation/pages/welcome_page.dart' as _i16;
import 'package:marketplace/presentation/routes/router.dart' as _i17;

abstract class $AppRouter extends _i18.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    CartRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CartPage(),
      );
    },
    DebugRoute.name: (routeData) {
      final args = routeData.argsAs<DebugRouteArgs>(
          orElse: () => const DebugRouteArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DebugPage(key: args.key),
      );
    },
    DesiredRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DesiredPage(),
      );
    },
    DiscoverRoute.name: (routeData) {
      final args = routeData.argsAs<DiscoverRouteArgs>(
          orElse: () => const DiscoverRouteArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DiscoverPage(key: args.key),
      );
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.FilterPage(
          key: args.key,
          filter: args.filter,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomePage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.LoginPage(key: args.key),
      );
    },
    LoginWithEmailRoute.name: (routeData) {
      final args = routeData.argsAs<LoginWithEmailRouteArgs>(
          orElse: () => const LoginWithEmailRouteArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.LoginWithEmailPage(key: args.key),
      );
    },
    MenuRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MenuRouteArgs>(
          orElse: () => MenuRouteArgs(path: pathParams.optString('path')));
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.MenuPage(
          key: args.key,
          path: args.path,
        ),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.NotificationPage(),
      );
    },
    ProductRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductRouteArgs>(
          orElse: () => ProductRouteArgs(id: pathParams.getString('id')));
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ProductPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => ProfileRouteArgs(id: pathParams.getString('id')));
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ProfilePage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>(
          orElse: () => const ResetPasswordRouteArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.ResetPasswordPage(key: args.key),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.SearchPage(
          key: args.key,
          filter: args.filter,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.SignUpPage(key: args.key),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.WelcomePage(),
      );
    },
    EmptyRouter.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.EmptyRouterPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CartPage]
class CartRoute extends _i18.PageRouteInfo<void> {
  const CartRoute({List<_i18.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DebugPage]
class DebugRoute extends _i18.PageRouteInfo<DebugRouteArgs> {
  DebugRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          DebugRoute.name,
          args: DebugRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DebugRoute';

  static const _i18.PageInfo<DebugRouteArgs> page =
      _i18.PageInfo<DebugRouteArgs>(name);
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
/// [_i3.DesiredPage]
class DesiredRoute extends _i18.PageRouteInfo<void> {
  const DesiredRoute({List<_i18.PageRouteInfo>? children})
      : super(
          DesiredRoute.name,
          initialChildren: children,
        );

  static const String name = 'DesiredRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DiscoverPage]
class DiscoverRoute extends _i18.PageRouteInfo<DiscoverRouteArgs> {
  DiscoverRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          DiscoverRoute.name,
          args: DiscoverRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static const _i18.PageInfo<DiscoverRouteArgs> page =
      _i18.PageInfo<DiscoverRouteArgs>(name);
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
/// [_i5.FilterPage]
class FilterRoute extends _i18.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    _i20.Key? key,
    required _i21.Filter filter,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          FilterRoute.name,
          args: FilterRouteArgs(
            key: key,
            filter: filter,
          ),
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const _i18.PageInfo<FilterRouteArgs> page =
      _i18.PageInfo<FilterRouteArgs>(name);
}

class FilterRouteArgs {
  const FilterRouteArgs({
    this.key,
    required this.filter,
  });

  final _i20.Key? key;

  final _i21.Filter filter;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key, filter: $filter}';
  }
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i18.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i18.PageInfo<HomeRouteArgs> page =
      _i18.PageInfo<HomeRouteArgs>(name);
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
/// [_i7.LoginPage]
class LoginRoute extends _i18.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i18.PageInfo<LoginRouteArgs> page =
      _i18.PageInfo<LoginRouteArgs>(name);
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
/// [_i8.LoginWithEmailPage]
class LoginWithEmailRoute extends _i18.PageRouteInfo<LoginWithEmailRouteArgs> {
  LoginWithEmailRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          LoginWithEmailRoute.name,
          args: LoginWithEmailRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginWithEmailRoute';

  static const _i18.PageInfo<LoginWithEmailRouteArgs> page =
      _i18.PageInfo<LoginWithEmailRouteArgs>(name);
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
/// [_i9.MenuPage]
class MenuRoute extends _i18.PageRouteInfo<MenuRouteArgs> {
  MenuRoute({
    _i19.Key? key,
    String? path,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          MenuRoute.name,
          args: MenuRouteArgs(
            key: key,
            path: path,
          ),
          rawPathParams: {'path': path},
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const _i18.PageInfo<MenuRouteArgs> page =
      _i18.PageInfo<MenuRouteArgs>(name);
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
/// [_i10.NotificationPage]
class NotificationRoute extends _i18.PageRouteInfo<void> {
  const NotificationRoute({List<_i18.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProductPage]
class ProductRoute extends _i18.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i20.Key? key,
    required String id,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const _i18.PageInfo<ProductRouteArgs> page =
      _i18.PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.id,
  });

  final _i20.Key? key;

  final String id;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i12.ProfilePage]
class ProfileRoute extends _i18.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i20.Key? key,
    required String id,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i18.PageInfo<ProfileRouteArgs> page =
      _i18.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.id,
  });

  final _i20.Key? key;

  final String id;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i13.ResetPasswordPage]
class ResetPasswordRoute extends _i18.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i18.PageInfo<ResetPasswordRouteArgs> page =
      _i18.PageInfo<ResetPasswordRouteArgs>(name);
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
/// [_i14.SearchPage]
class SearchRoute extends _i18.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i19.Key? key,
    _i21.Filter? filter,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            filter: filter,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i18.PageInfo<SearchRouteArgs> page =
      _i18.PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    this.filter,
  });

  final _i19.Key? key;

  final _i21.Filter? filter;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, filter: $filter}';
  }
}

/// generated route for
/// [_i15.SignUpPage]
class SignUpRoute extends _i18.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i18.PageInfo<SignUpRouteArgs> page =
      _i18.PageInfo<SignUpRouteArgs>(name);
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
/// [_i16.WelcomePage]
class WelcomeRoute extends _i18.PageRouteInfo<void> {
  const WelcomeRoute({List<_i18.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i17.EmptyRouterPage]
class EmptyRouter extends _i18.PageRouteInfo<void> {
  const EmptyRouter({List<_i18.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}
