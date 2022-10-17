import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/desired.dart';

part 'desired_state.freezed.dart';

@freezed
class DesiredState with _$DesiredState {
  const factory DesiredState.load() = DesiredStateLoad;
  const factory DesiredState.loading({
    required List<Desired> desireds,
  }) = DesiredStateLoading;
  const factory DesiredState.error() = DesiredStateError;
  const factory DesiredState.noNetwork() = DesiredStateNoNetwork;
}
