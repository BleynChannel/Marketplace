import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/entity/filter.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/domain/entity/product.dart';

class Utils {
  static String? isNicknameValid(String text) {
    return text.isEmpty ? 'utilsIsNicknameValid'.tr : null;
  }

  static String? isEmailValid(String text) {
    return GetUtils.isEmail(text) ? null : 'utilsIsEmailValid'.tr;
  }

  static String? isPasswordValid(String text) {
    return RegExp(r"^[a-zA-Z0-9.,!#$%&№'*+-/=?^_`(){|}~]+.{7,}$").hasMatch(text)
        ? null
        : 'utilsIsPasswordValid'.tr;
  }

  static String? isImageValid(String text) {
    return GetUtils.isURL(text) && GetUtils.isImage(text)
        ? null
        : 'utilsIsImageValid'.tr;
  }

  static const _platformsList = [
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

  static String platformToName(Platform platform) =>
      _platformsList[platform.index];
  static Platform platformFromName(String name) =>
      Platform.values[_platformsList.indexOf(name)];

  static const _platformIcons = [
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

  static IconData platformToIcon(Platform platform) =>
      _platformIcons[platform.index];

  static const _pathToSvgIconsContactsMap = {
    'Steam': 'assets/icons/social/steam.svg',
    'Epic Games': 'assets/icons/social/epic_games.svg',
    'Discord': 'assets/icons/social/discord.svg',
    'GitHub': 'assets/icons/social/github.svg',
  };

  static String contactsToPathToSvgIcons(String name) =>
      _pathToSvgIconsContactsMap[name]!;

  static String _addNullWithTime(int time) => time < 10 ? '0$time' : '$time';

  static String dateTimeToString(DateTime dateTime) =>
      '${_addNullWithTime(dateTime.hour)}:${_addNullWithTime(dateTime.minute)} ${_addNullWithTime(dateTime.day)}.${_addNullWithTime(dateTime.month)}.${dateTime.year}';

  static String releaseDateToString(DateTime releaseDate) =>
      '${_addNullWithTime(releaseDate.day)}.${_addNullWithTime(releaseDate.month)}.${releaseDate.year}';

  static bool isCorrectFilter(Product product, Filter filter) {
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

    return isCorrect.every((element) => element == true);
  }

  static String getCompactCount(int value) {
    if (value >= 1000000) {
      return '${(value / 1000000).floor()}M';
    } else if (value >= 1000) {
      return '${(value / 1000).floor()}k';
    }

    return value.toString();
  }

  static Future<Media> getMediaImage({
    required String path,
    required MediaLocation mediaLocation,
  }) async {
    MediaData? data;
    if (mediaLocation == MediaLocation.local) {
      data =
          MediaData(data: (await rootBundle.load(path)).buffer.asUint8List());
    } else {
      //TODO: Загружать картинку через базу данных
      data =
          MediaData(data: (await rootBundle.load(path)).buffer.asUint8List());
    }

    return Future.value(Media(
      type: MediaType.image,
      location: mediaLocation,
      data: data,
    ));
  }

  static Future<Media> getMediaVideo({
    required String path,
    required MediaLocation mediaLocation,
  }) async {
    MediaData? data;
    if (mediaLocation == MediaLocation.local) {
      data = MediaData(data: path);
    } else {
      //TODO: Загружать видео через базу данных
      data = MediaData(data: path);
    }

    return Future.value(Media(
      type: MediaType.video,
      location: mediaLocation,
      data: data,
    ));
  }

  static void sendScaffoldMessage(BuildContext context,
      {required String message}) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.hideCurrentSnackBar();
    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
