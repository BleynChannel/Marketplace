import 'package:marketplace/domain/entity/achievement.dart';
import 'package:marketplace/domain/entity/product.dart';

class Profile {
  final String nickname;
  final String pathToAvatar;
  final String pathToBackgroundImage;
  final String status;
  final int purchases;
  final int desired;
  final List<String> contacts;
  final List<Achievement> achievements;
  final List<Product> favoriteGames;
  final DateTime registrationDate;
  final DateTime lastActivity;

  Profile({
    required this.nickname,
    required this.pathToAvatar,
    required this.pathToBackgroundImage,
    required this.status,
    required this.purchases,
    required this.desired,
    required this.contacts,
    required this.achievements,
    required this.favoriteGames,
    required this.registrationDate,
    required this.lastActivity,
  });
}
