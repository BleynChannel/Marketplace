import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData? getPlatformIcon(String name) {
  switch (name) {
    case 'Windows':
      return FontAwesomeIcons.windows;
    case 'Linux':
      return FontAwesomeIcons.linux;
    case 'MacOS':
      return FontAwesomeIcons.a;
    case 'Android':
      return FontAwesomeIcons.android;
    case 'IOS':
      return FontAwesomeIcons.a;
    case 'Nintendo Switch':
      return FontAwesomeIcons.a;
    case 'PS4':
      return FontAwesomeIcons.playstation;
    case 'Xbox One':
      return FontAwesomeIcons.xbox;
    case 'PS5':
      return FontAwesomeIcons.playstation;
    default:
      return null;
  }
}
