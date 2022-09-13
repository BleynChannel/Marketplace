import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData? getPlatformIcon(String name) {
  switch (name) {
    case 'Windows':
      return FontAwesomeIcons.windows;
    case 'Linux':
      return FontAwesomeIcons.linux;
    case 'MacOS':
      return FontAwesomeIcons.desktop;
    case 'Android':
      return FontAwesomeIcons.android;
    case 'IOS':
      return FontAwesomeIcons.apple;
    case 'Nintendo Switch':
      return FontAwesomeIcons.gamepad;
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

Color? getStatusColor(String status) {
  switch (status) {
    case 'Gamer':
      return Colors.lightGreen;
    default:
      return null;
  }
}

String? getPathToSvgIconsContacts(String name) {
  switch (name) {
    case 'Steam':
      return 'assets/icons/steam.svg';
    case 'Epic Games':
      return 'assets/icons/epic_games.svg';
    case 'Discord':
      return 'assets/icons/discord.svg';
    case 'Facebook':
      return 'assets/icons/facebook.svg';
    case 'VK':
      return 'assets/icons/vk.svg';
    default:
      return null;
  }
}

String _addNullWithTime(int time) => time < 10 ? "0$time" : "$time";

String dateTimeToString(DateTime dateTime) =>
    '${_addNullWithTime(dateTime.hour)}:${_addNullWithTime(dateTime.minute)} ${_addNullWithTime(dateTime.day)}.${_addNullWithTime(dateTime.month)}.${dateTime.year}';
