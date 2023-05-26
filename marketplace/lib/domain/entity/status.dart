import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
class Status with _$Status {
  const Status._();

  const factory Status({
    required String title,
    required Color color,
  }) = _Status;

  factory Status.fromMap(Map<String, dynamic> json) {
    return Status(
      title: json['title'] as String,
      color: Color(json['color'] as int),
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'color': color.value,
      };
}
