import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_email_state.freezed.dart';

@freezed
class LoginWithEmailState with _$LoginWithEmailState {
  const factory LoginWithEmailState.empty() = LoginWithEmailStateEmpty;
  const factory LoginWithEmailState.success() = LoginWithEmailStateSuccess;
  const factory LoginWithEmailState.error({required String message}) =
      LoginWithEmailStateError;
  const factory LoginWithEmailState.noNetwork() = LoginWithEmailStateNoNetwork;
}
