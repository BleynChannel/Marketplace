import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.empty() = LoginStateEmpty;
  const factory LoginState.success() = LoginStateSuccess;
  const factory LoginState.error({required String message}) = LoginStateError;
  const factory LoginState.noNetwork() = LoginStateNoNetwork;
}
