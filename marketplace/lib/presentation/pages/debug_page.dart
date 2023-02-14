import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/repository/auth_repository.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';

class DebugPage extends StatelessWidget {
  DebugPage({Key? key}) : super(key: key) {
    debugInit().then((_) {
      final repository = Get.find<AuthRepository>();
      final router = Get.find<AppRouter>();
      router.replaceAll(
        repository.uid != null ? [HomeRoute()] : const [WelcomeRoute()],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
