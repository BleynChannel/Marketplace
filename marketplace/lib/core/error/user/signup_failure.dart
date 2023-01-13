import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_failure.freezed.dart';

@freezed
class SignUpFailure with _$SignUpFailure {
  const factory SignUpFailure.unknown() = SignUpFailureUnknown;
  const factory SignUpFailure.networkRequestFailed() = SignUpFailureNetworkRequestFailed;
  const factory SignUpFailure.emailAlreadyInUse() = SignUpFailureEmailAlreadyInUse;
  const factory SignUpFailure.invalidEmail() = SignUpFailureInvalidEmail;
  const factory SignUpFailure.operationNotAllowed() = SignUpFailureOperationNotAllowed;
  const factory SignUpFailure.weakPassword() = SignUpFailureWeakPassword;
}