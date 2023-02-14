import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeAvatarProvider extends GetxController {
  final Rx<Uint8List> rxImage;
  Uint8List get image => rxImage.value;
  set image(Uint8List value) => rxImage.value = value;

  HomeAvatarProvider(Uint8List image) : rxImage = image.obs;
}
