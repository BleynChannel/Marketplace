import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/price.dart';

part 'bundle.freezed.dart';

@freezed
class Bundle with _$Bundle {
  const factory Bundle({
    required String title,
    required Price price,
    required List<CompactProduct> products,
  }) = _Bundle;
}