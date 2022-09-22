import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/media.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String nickname,
    required Media avatar,
  }) = _User;

  //TODO: Сделать преобразователи
  // Profile toProfile() {}
}
