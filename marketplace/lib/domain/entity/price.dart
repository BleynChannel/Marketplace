import 'package:freezed_annotation/freezed_annotation.dart';

part 'price.freezed.dart';

@freezed
class Price with _$Price {
  const factory Price({
    required double price,
    required double oldPrice,
    required double discount,
  }) = _Price;
}
