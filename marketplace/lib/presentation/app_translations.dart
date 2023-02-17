import 'package:get/get.dart';
import 'package:marketplace/presentation/translations/english_usa.dart';
import 'package:marketplace/presentation/translations/russia.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnglishUSA().keys,
        'ru_RU': Russia().keys,
      };

  static final Map<String, String> _languages = {
    'en_US': 'English (USA)',
    'ru_RU': 'Русский',
  };
  static Map<String, String> get language => _languages;
}
