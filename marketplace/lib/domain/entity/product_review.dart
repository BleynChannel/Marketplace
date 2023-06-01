import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/user.dart';

part 'product_review.freezed.dart';

@freezed
class ProductReview with _$ProductReview {
  const ProductReview._();

  const factory ProductReview({
    required User user,
    required double rating,
    required String description,
    required DateTime createdAt,
  }) = _ProductReview;

  factory ProductReview.fromMap(Map<String, dynamic> json) => ProductReview(
        user: User.fromMap(json['user']),
        rating: json['rating'],
        description: json['description'],
        createdAt: json['created_at'],
      );

  Map<String, dynamic> toMap() => {
        'user': user.toMap(),
        'rating': rating,
        'description': description,
        'created_at': createdAt,
      };
}
