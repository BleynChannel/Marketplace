import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_failure.freezed.dart';

@freezed
class GetUserFailure with _$GetUserFailure {
  const factory GetUserFailure.unknown() = GetUserFailureUnknown;
}
