import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/profile.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.load() = ProfileStateLoad;
  const factory ProfileState.loading({
    required Profile profile,
  }) = ProfileStateLoading;
  const factory ProfileState.error({required String message}) = ProfileStateError;
  const factory ProfileState.noNetwork() = ProfileStateNoNetwork;
}
