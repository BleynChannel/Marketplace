import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';

enum MediaType {
  image,
  video,
}

//Для картинок
enum MediaLocation {
  local,
  remote,
}

@freezed
class MediaData with _$MediaData {
  const MediaData._();

  const factory MediaData({
    required dynamic data,
  }) = _MediaData;

  Uint8List toImage() => data as Uint8List;
  String toVideo() => data as String;
}

@freezed
class Media with _$Media {
  const factory Media({
    required MediaType type,
    required MediaLocation location,
    required MediaData data,
  }) = _Media;
}
