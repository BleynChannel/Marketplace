import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required String title,
    required String pathToImage,
    required String description,
  }) = _Notification;
}
