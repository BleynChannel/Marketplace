import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/media.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String id,
    required String nickname,
    required Media avatar,
  }) = _User;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json['id'],
        nickname: json['nickname'],
        avatar: Media(type: MediaType.image, data: json['avatar']),
  );

  Map<String, dynamic> toMap() => {
        'id': id,
        'nickname': nickname,
        'avatar': avatar,
  };
}
