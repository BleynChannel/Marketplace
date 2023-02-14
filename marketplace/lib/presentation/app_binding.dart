import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:marketplace/data/datasource/auth/auth_remote_data_source.dart';
import 'package:marketplace/data/datasource/product/product_remote_data_source.dart';
import 'package:marketplace/data/datasource/user/user_remote_data_source.dart';
import 'package:marketplace/domain/repository/auth_repository.dart';
import 'package:marketplace/domain/repository/product_repository.dart';
import 'package:marketplace/domain/repository/user_repository.dart';
import 'package:marketplace/presentation/controller/login_with_email_controller.dart';
import 'package:marketplace/presentation/controller/menu_controller.dart';
import 'package:marketplace/presentation/controller/reset_password_controller.dart';
import 'package:marketplace/presentation/controller/signup_controller.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/presentation/provider/auth_provider.dart';
import 'package:marketplace/presentation/provider/home_avatar_provider.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';

class AppBinding implements Bindings {
  final AppRouter router;

  AppBinding(this.router);

  @override
  void dependencies() async {
    await repositoryDependencies();
    providerDependencies();
    controllerDependencies();
  }

  Future repositoryDependencies() async {
    final authRepository = await Get.putAsync(() async {
      final repository = AuthRepository(AuthRemoteDataSource());

      final result = await repository.init();
      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
        );

        log('User cant loading: $message');
        exit(-1);
      }, (_) {});

      return repository;
    });
    Get.lazyPut(() => UserRepository(UserRemoteDataSource()));
    Get.lazyPut(() => ProductRepository(ProductRemoteDataSource()));

    authRepository.rxUid.listen((uid) {
      router.replaceAll(uid != null ? [HomeRoute()] : const [WelcomeRoute()]);
    });
  }

  void providerDependencies() {
    Get.lazyPut(() => AuthProvider());
    Get.lazyPut(() => HomeAvatarProvider(debugProfile.avatar.data.toImage()));
  }

  void controllerDependencies() {
    Get.lazyPut(() => LoginWithEmailController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => ResetPasswordController());
    Get.lazyPut(() => MenuController());
  }
}
