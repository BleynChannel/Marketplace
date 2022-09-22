import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/user.dart';

part 'product_review.freezed.dart';

@freezed
class ProductReview with _$ProductReview {
  const factory ProductReview({
    required User user,
    required double rating,
    required String description,
  }) = _ProductReview;
}
