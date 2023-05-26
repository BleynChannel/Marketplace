import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/achievement.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/contact.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/status.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String nickname,
    required Media avatar,
    required Media backgroundImage,
    Status? status,
    required int purchases,
    required int desired,
    required List<Contact> contacts,
    required List<Achievement> achievements,
    required List<CompactProduct> favoriteGames,
    required DateTime registrationDate,
    required DateTime lastActivity,
  }) = _Profile;
}
