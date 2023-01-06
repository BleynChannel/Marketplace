import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/media.dart';

part 'contact.freezed.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    required String name,
    required Media icon,
    required String url,
  }) = _Contact;
}
