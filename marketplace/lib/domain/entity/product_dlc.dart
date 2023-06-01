import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/price.dart';

part 'product_dlc.freezed.dart';

@freezed
class ProductDLC with _$ProductDLC {
  const ProductDLC._();

  const factory ProductDLC({
    required String title,
    required Price price,
  }) = _ProductDLC;

  factory ProductDLC.fromMap(Map<String, dynamic> json) => ProductDLC(
        title: json['title'],
        price: Price.fromMap(json['price']),
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'price': price.toMap(),
      };
}
