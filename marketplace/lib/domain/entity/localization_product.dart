import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_product.freezed.dart';

@freezed
class LocalizationProduct with _$LocalizationProduct {
  const LocalizationProduct._();

  const factory LocalizationProduct({
    required String language,
    required bool enabledSound,
    required bool enabledInterface,
    required bool enabledSubtitles,
  }) = _LocalizationProduct;

  factory LocalizationProduct.fromMap(Map<String, dynamic> json) =>
      LocalizationProduct(
          language: json['language'],
          enabledSound: json['enabledSound'],
          enabledInterface: json['enabledInterface'],
          enabledSubtitles: json['enabledSubtitles']);

  Map<String, dynamic> toMap() => {
        'language': language,
        'enabledSound': enabledSound,
        'enabledInterface': enabledInterface,
        'enabledSubtitles': enabledSubtitles,
      };
}
