import 'package:marketplace/domain/entity/achievement.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/contact.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/status.dart';
import 'package:marketplace/domain/entity/user.dart';

class Profile {
  late String nickname;
  late Media avatar;
  late Media backgroundImage;
  late Status status;
  late int purchases;
  late int desired;
  late List<Contact> contacts;
  late List<Achievement> achievements;
  late List<CompactProduct> favoriteGames;
  final DateTime registrationDate;
  final DateTime lastActivity;

  Profile({
    required this.nickname,
    required this.avatar,
    required this.backgroundImage,
    required this.status,
    required this.purchases,
    required this.desired,
    required this.contacts,
    required this.achievements,
    required this.favoriteGames,
    required this.registrationDate,
    required this.lastActivity,
  });

  User toUser() => User(nickname: nickname, avatar: avatar);
}
