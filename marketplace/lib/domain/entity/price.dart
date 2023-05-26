import 'package:freezed_annotation/freezed_annotation.dart';

part 'price.freezed.dart';

@freezed
class Price with _$Price {
  const Price._();

  const factory Price({
    required double price,
    required double oldPrice,
    required double discount,
  }) = _Price;

  factory Price.fromMap(Map<String, dynamic> json) => Price(
        price: json['price'] as double,
        oldPrice: json['old_price'] as double,
        discount: json['discount'] as double,
      );

  Map<String, dynamic> toMap() => {
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
      };
}
