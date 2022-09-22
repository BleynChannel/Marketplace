import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_product.freezed.dart';

@freezed
class LocalizationProduct with _$LocalizationProduct {
  const factory LocalizationProduct({
    required String language,
    required bool enabledSound,
    required bool enabledInterface,
    required bool enabledSubtitles,
  }) = _LocalizationProduct;
}
