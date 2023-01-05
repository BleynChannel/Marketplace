import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/notification.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.load() = NotificationStateLoad;
  const factory NotificationState.loading({
    required List<Notification> notifications,
  }) = NotificationStateLoading;
  const factory NotificationState.error({required String message}) =
      NotificationStateError;
  const factory NotificationState.noNetwork() = NotificationStateNoNetwork;
}
