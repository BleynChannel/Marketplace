import 'package:flutter/foundation.dart';

class HomeAvatarModel with ChangeNotifier {
  late Uint8List _image;

  Uint8List get image => _image;
  set image(Uint8List value) {
    _image = value;
    notifyListeners();
  }

  HomeAvatarModel({required Uint8List image}) : _image = image;
}
