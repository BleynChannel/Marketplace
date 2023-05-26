import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';

enum MediaType {
  image,
  video,
}

@freezed
class Media with _$Media {
  const Media._();

  const factory Media({
    required MediaType type,
    required dynamic data,
  }) = _Media;

  Uint8List? toImage() => type == MediaType.image ? data as Uint8List : null;
  String? toVideo() => type == MediaType.video ? data as String : null;
}
