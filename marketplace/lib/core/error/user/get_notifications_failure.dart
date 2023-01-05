import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_notifications_failure.freezed.dart';

@freezed
class GetNotificationsFailure with _$GetNotificationsFailure {
  const factory GetNotificationsFailure.unknown() =
      GetNotificationsFailureUnknown;
}
