import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_out_failure.freezed.dart';

@freezed
class SignOutFailure with _$SignOutFailure {
  const factory SignOutFailure.unknown() = SignOutFailureUnknown;
  const factory SignOutFailure.networkRequestFailed() = SignOutFailureNetworkRequestFailed;
}
