import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_email_failure.freezed.dart';

@freezed
class LoginWithEmailFailure with _$LoginWithEmailFailure {
  const factory LoginWithEmailFailure.unknown() = LoginWithEmailFailureUnknown;
  const factory LoginWithEmailFailure.invalidEmail() =
      LoginWithEmailFailureInvalidEmail;
  const factory LoginWithEmailFailure.userDisabled() =
      LoginWithEmailFailureUserDisabled;
  const factory LoginWithEmailFailure.userNotFound() =
      LoginWithEmailFailureUserNotFound;
  const factory LoginWithEmailFailure.wrongPassword() =
      LoginWithEmailFailureWrongPassword;
}
