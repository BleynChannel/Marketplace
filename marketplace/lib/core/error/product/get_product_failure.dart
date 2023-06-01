import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_product_failure.freezed.dart';

@freezed
class GetProductFailure with _$GetProductFailure {
  const factory GetProductFailure.unknown() =
      GetProductFailureUnknown;
  const factory GetProductFailure.notFound() = GetProductFailureNotFound;
}
