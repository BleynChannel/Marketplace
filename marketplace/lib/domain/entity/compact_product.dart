import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/domain/entity/price.dart';
import 'package:marketplace/domain/entity/product.dart';
import 'package:marketplace/presentation/debug_data.dart';

part 'compact_product.freezed.dart';

@freezed
class CompactProduct with _$CompactProduct {
  const CompactProduct._();

  const factory CompactProduct({
    required String id,
    required String title,
    required Media banner,
    required Price price,
    required List<Platform> platforms,
  }) = _CompactProduct;

  //TODO: Сделать преобразователи
  Product toProduct() =>
      debugProductList[debugCompactProductList.indexOf(this)];
}
