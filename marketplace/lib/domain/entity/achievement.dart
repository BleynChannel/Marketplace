import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement.freezed.dart';

@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required String title,
    required String description,
    required String icon,
  }) = _Achievement;
}
