import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/price.dart';

part 'product_dlc.freezed.dart';

@freezed
class ProductDLC with _$ProductDLC {
  const factory ProductDLC({
    required String title,
    required Price price,
  }) = _ProductDLC;
}
