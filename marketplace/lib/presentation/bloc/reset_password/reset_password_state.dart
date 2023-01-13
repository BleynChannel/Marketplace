import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.empty() = ResetPasswordStateEmpty;
  const factory ResetPasswordState.success() = ResetPasswordStateSuccess;
  const factory ResetPasswordState.error({required String message}) = ResetPasswordStateError;
  const factory ResetPasswordState.noNetwork() = ResetPasswordStateNoNetwork;
}
