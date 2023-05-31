import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/core/utils/utils.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/domain/entity/price.dart';

part 'compact_product.freezed.dart';

@freezed
class CompactProduct with _$CompactProduct {
  const CompactProduct._();

  const factory CompactProduct({
    required String id,
    required String title,
    Media? banner,
    required Price price,
    required List<Platform> platforms,
  }) = _CompactProduct;

  factory CompactProduct.fromMap(String id, Map<String, dynamic> json) => CompactProduct(
        id: id,
        title: json['title'],
        price: Price.fromMap(json['price']),
        platforms: (json['platforms'] as List<dynamic>)
            .map((p) => Utils.platformFromName(p))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'price': price.toMap(),
        'platforms': platforms.map((p) => Utils.platformToName(p)).toList(),
      };
}
