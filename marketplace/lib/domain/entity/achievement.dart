import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/media.dart';

part 'achievement.freezed.dart';

@freezed
class Achievement with _$Achievement {
  const Achievement._();

  const factory Achievement({
    required String title,
    required String description,
    required Media icon,
  }) = _Achievement;

  factory Achievement.fromMap(Map<String, dynamic> json) => Achievement(
        title: json['title'] as String,
        description: json['description'] as String,
        icon: Media(type: MediaType.image, data: json['icon']),
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
        'icon': icon.toImage(),
      };
}
