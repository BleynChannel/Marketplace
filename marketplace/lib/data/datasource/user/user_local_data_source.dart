import 'dart:ui';

import 'package:get/get.dart';

class UserLocalDataSource {
  Future<String> getLanguage() async {
    return window.locale.toString();
  }

  Future changeLanguage({required String language}) async {
    final codes = language.split('_');
    Get.updateLocale(Locale(codes.first, codes.last));
  }
}
