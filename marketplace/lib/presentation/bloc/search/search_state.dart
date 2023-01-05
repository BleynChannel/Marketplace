import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/compact_product.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.load() = SearchStateLoad;
  const factory SearchState.loading({
    required List<CompactProduct> filterProducts,
  }) = SearchStateLoading;
  const factory SearchState.error({required String message}) = SearchStateError;
  const factory SearchState.noNetwork() = SearchStateNoNetwork;
}
