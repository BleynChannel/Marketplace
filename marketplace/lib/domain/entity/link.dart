import 'package:freezed_annotation/freezed_annotation.dart';

part 'link.freezed.dart';

@freezed
class Link with _$Link {
  const Link._();

  const factory Link({
    required String title,
    required String url,
  }) = _Link;

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        title: json['title'],
        url: json['url'],
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'url': url,
      };
}
