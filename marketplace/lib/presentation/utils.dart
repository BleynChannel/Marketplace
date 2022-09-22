import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketplace/domain/entity/filter.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/domain/entity/product.dart';

const _platformsList = [
  'Windows',
  'Linux',
  'MacOS',
  'Android',
  'IOS',
  'Nintendo Switch',
  'PS4',
  'Xbox One',
  'PS5',
  'Oculus Rift',
  'HTC Vive',
  'Valve Index',
];

String platformToName(Platform platform) => _platformsList[platform.index];
Platform platformFromName(String name) =>
    Platform.values[_platformsList.indexOf(name)];

const _platformIcons = [
  FontAwesomeIcons.windows,
  FontAwesomeIcons.linux,
  FontAwesomeIcons.desktop,
  FontAwesomeIcons.android,
  FontAwesomeIcons.apple,
  FontAwesomeIcons.gamepad,
  FontAwesomeIcons.playstation,
  FontAwesomeIcons.xbox,
  FontAwesomeIcons.playstation
];

IconData platformToIcon(Platform platform) => _platformIcons[platform.index];

const Map<String, Color> _statusMap = {
  'Gamer': Colors.lightGreen,
};

Color statusToColor(String status) => _statusMap[status]!;

const _pathToSvgIconsContactsMap = {
  'Steam': 'assets/icons/steam.svg',
  'Epic Games': 'assets/icons/epic_games.svg',
  'Discord': 'assets/icons/discord.svg',
  'Facebook': 'assets/icons/facebook.svg',
  'VK': 'assets/icons/vk.svg',
};

String contactsToPathToSvgIcons(String name) =>
    _pathToSvgIconsContactsMap[name]!;

String _addNullWithTime(int time) => time < 10 ? '0$time' : '$time';

String dateTimeToString(DateTime dateTime) =>
    '${_addNullWithTime(dateTime.hour)}:${_addNullWithTime(dateTime.minute)} ${_addNullWithTime(dateTime.day)}.${_addNullWithTime(dateTime.month)}.${dateTime.year}';

String releaseDateToString(DateTime releaseDate) =>
    '${_addNullWithTime(releaseDate.day)}.${_addNullWithTime(releaseDate.month)}.${releaseDate.year}';

bool isCorrectFilter(Product product, Filter filter) {
  final isCorrect = [
    product.title.toLowerCase().contains(filter.title.toLowerCase()),
    (filter.minPrice <= product.price.price) &&
        (filter.maxPrice >= product.price.price),
    (filter.minYearOfRelease.floor() <= product.releaseDate.year) &&
        (filter.maxYearOfRelease.floor() >= product.releaseDate.year),
    product.genre
            .where((element) => filter.genre.contains(element))
            .isNotEmpty ||
        filter.genre.isEmpty,
    product.stylistics
            .where((element) => filter.stylistics.contains(element))
            .isNotEmpty ||
        filter.stylistics.isEmpty,
    product.platforms
            .where((element) => filter.platforms.contains(element))
            .isNotEmpty ||
        filter.platforms.isEmpty,
    product.multiplayer
            .where((element) => filter.multiplayer.contains(element))
            .isNotEmpty ||
        filter.multiplayer.isEmpty,
  ];

  return isCorrect.any((element) => element == true);
}

String getCompactCount(int value) {
  if (value >= 1000000) {
    return '${(value / 1000000).floor()}M';
  } else if (value >= 1000) {
    return '${(value / 1000).floor()}k';
  } else {
    return value.toString();
  }
}
