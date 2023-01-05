import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_profile_failure.freezed.dart';

@freezed
class GetProfileFailure with _$GetProfileFailure {
  const factory GetProfileFailure.unknown() =
      GetProfileFailureUnknown;
}
