import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';

enum MediaType {
  image,
  video,
}

@freezed
class Media with _$Media {
  const factory Media({
    required MediaType type,
    required String path,
  }) = _Media;
}
