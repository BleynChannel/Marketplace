import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/compact_product.dart';

part 'desired.freezed.dart';

@freezed
class Desired with _$Desired {
  const factory Desired({
    required CompactProduct product,
  }) = _Desired;
}
