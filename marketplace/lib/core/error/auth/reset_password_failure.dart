import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_failure.freezed.dart';

@freezed
class ResetPasswordFailure with _$ResetPasswordFailure {
  const factory ResetPasswordFailure.unknown() = ResetPasswordFailureUnknown;
  const factory ResetPasswordFailure.networkRequestFailed() = ResetPasswordFailureNetworkRequestFailed;
  const factory ResetPasswordFailure.invalidEmail() =
      ResetPasswordFailureInvalidEmail;
  const factory ResetPasswordFailure.missingAndroidPkgName() =
      ResetPasswordFailureMissingAndroidPkgName;
  const factory ResetPasswordFailure.missingContinueUri() =
      ResetPasswordFailureMissingContinueUri;
  const factory ResetPasswordFailure.missingIosBundleId() =
      ResetPasswordFailureMissingIosBundleId;
  const factory ResetPasswordFailure.invalidContinueUri() =
      ResetPasswordFailureInvalidContinueUri;
  const factory ResetPasswordFailure.unauthorizedContinueUri() =
      ResetPasswordFailureUnauthorizedContinueUri;
  const factory ResetPasswordFailure.userNotFound() =
      ResetPasswordFailureUserNotFound;
}
