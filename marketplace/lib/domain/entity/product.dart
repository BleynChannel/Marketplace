import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/bundle.dart';
import 'package:marketplace/domain/entity/link.dart';
import 'package:marketplace/domain/entity/localization_product.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/domain/entity/price.dart';
import 'package:marketplace/domain/entity/product_dlc.dart';
import 'package:marketplace/domain/entity/product_review.dart';
import 'package:marketplace/domain/entity/system_requirement.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const Product._();

  const factory Product({
    required String id,
    required String title,
    required String description,
    required Media icon,
    required List<Media> media,
    required Price price,
    required double rating,
    required int countBuy,
    required List<String> genre,
    required List<String> stylistics,
    required List<Platform> platforms,
    required List<String> multiplayer,
    required List<LocalizationProduct> localization,
    required String developer,
    required String publisher,
    required DateTime releaseDate,
    required List<Link> links,
    required List<ProductDLC> productDlc,
    required List<Bundle> bundles,
    required List<SystemRequirement> systemRequirement,
    required List<ProductReview> productReview,
  }) = _Product;
}
