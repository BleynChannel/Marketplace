import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/compact_product.dart';

part 'discover_state.freezed.dart';

@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState.load() = DiscoverStateLoad;
  const factory DiscoverState.loading({
    required Map<String, List<CompactProduct>> products,
  }) = DiscoverStateLoading;
  const factory DiscoverState.error({required String message}) =
      DiscoverStateError;
  const factory DiscoverState.noNetwork() = DiscoverStateNoNetwork;
}
