import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_products_failure.freezed.dart';

@freezed
class SearchProductsFailure with _$SearchProductsFailure {
  const factory SearchProductsFailure.unknown() =
      SearchProductsFailureUnknown;
}
