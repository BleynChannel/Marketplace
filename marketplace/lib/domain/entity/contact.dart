import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/media.dart';

part 'contact.freezed.dart';

@freezed
class Contact with _$Contact {
  const Contact._();

  const factory Contact({
    required String name,
    required Media icon,
    required String url,
  }) = _Contact;

  factory Contact.fromMap(Map<String, dynamic> json) => Contact(
        name: json['name'] as String,
        icon: Media(type: MediaType.image, data: json['icon'] as String),
        url: json['url'] as String,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'icon': icon.toImage(),
        'url': url,
      };
}
