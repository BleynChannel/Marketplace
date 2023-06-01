import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/price.dart';

part 'bundle.freezed.dart';

@freezed
class Bundle with _$Bundle {
  const Bundle._();

  const factory Bundle({
    required String title,
    required Price price,
    required List<CompactProduct> products,
  }) = _Bundle;

  factory Bundle.fromMap(Map<String, dynamic> json) => Bundle(
        title: json['title'],
        price: Price.fromMap(json['price']),
        products: json['products'],
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'price': price.toMap(),
        'products': products,
      };
}
