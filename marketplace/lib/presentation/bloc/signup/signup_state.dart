import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.empty() = SignUpStateEmpty;
  const factory SignUpState.success() = SignUpStateSuccess;
  const factory SignUpState.error({required String message}) = SignUpStateError;
  const factory SignUpState.noNetwork() = SignUpStateNoNetwork;
}