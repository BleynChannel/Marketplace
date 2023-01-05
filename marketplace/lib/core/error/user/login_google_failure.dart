import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_google_failure.freezed.dart';

@freezed
class LoginGoogleFailure with _$LoginGoogleFailure {
  const factory LoginGoogleFailure.unknown() = LoginGoogleFailureUnknown;
  const factory LoginGoogleFailure.accountExistsWithDifferentCredential() =
      LoginGoogleFailureAccountExistsWithDifferentCredential;
  const factory LoginGoogleFailure.invalidCredential() =
      LoginGoogleFailureInvalidCredential;
  const factory LoginGoogleFailure.operationNotAllowed() =
      LoginGoogleFailureOperationNotAllowed;
  const factory LoginGoogleFailure.userDisabled() =
      LoginGoogleFailureUserDisabled;
  const factory LoginGoogleFailure.userNotFound() =
      LoginGoogleFailureUserNotFound;
  const factory LoginGoogleFailure.wrongPassword() =
      LoginGoogleFailureWrongPassword;
  const factory LoginGoogleFailure.invalidVerificationCode() =
      LoginGoogleFailureInvalidVerificationCode;
  const factory LoginGoogleFailure.invalidVerificationId() =
      LoginGoogleFailureInvalidVerificationId;
}
