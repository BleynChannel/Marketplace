import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace/core/error/product/get_product_failure.dart';
import 'package:marketplace/data/utils/firebase_utils.dart';
import 'package:marketplace/domain/entity/bundle.dart';
import 'package:marketplace/domain/entity/cart_product.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/desired.dart';
import 'package:marketplace/domain/entity/filter.dart' as f;
import 'package:marketplace/domain/entity/link.dart';
import 'package:marketplace/domain/entity/localization_product.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/domain/entity/price.dart';
import 'package:marketplace/domain/entity/product.dart';
import 'package:marketplace/domain/entity/product_dlc.dart';
import 'package:marketplace/domain/entity/product_review.dart';
import 'package:marketplace/domain/entity/system_requirement.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/core/utils/utils.dart';

class ProductRemoteDataSource {
  Future<Map<String, List<CompactProduct>>> discoverGetProducts(
      {required List<Platform> platforms}) async {
    final debugFilteredProductList = debugCompactProductList
        .where((product) => product.platforms
            .where(
              (element) => platforms.contains(element),
            )
            .isNotEmpty)
        .toList();

    return Future.value({
      'Main': debugCompactProductList,
      'Most Popular': debugFilteredProductList,
      'Free This Week': debugFilteredProductList,
      'Special Offers': debugFilteredProductList,
      'You will like': debugFilteredProductList,
    });
  }

  Future<List<CartProduct>> getCartProducts() async {
    return Future.value(debugCartProductList);
  }

  Future<List<Desired>> getDesired() async {
    return Future.value(debugDesiredList);
  }

  Future<Product> getProduct({required String id}) async {
    final product = FirebaseFirestore.instance.collection('products').doc(id);
    final productDoc = await product.get();
    if (!productDoc.exists) {
      throw const GetProductFailure.notFound();
    }

    final productData = productDoc.data()!;

    return Product(
      id: id,
      title: productData['title'] as String,
      description: productData['description'] as String,
      icon: Media(
          type: MediaType.image,
          data: await FirebaseUtils.loadImage(productData['icon'] as String)),
      media: (await Utils.futureMap(
        await product.collection('media').get().then((c) => c.docs),
        (doc) async {
          final data = doc.data();

          if (data['type'] == 'video') {
            return Media(
              type: MediaType.video,
              data: data['url'] as String,
            );
          } else if (data['type'] == 'image') {
            return Media(
              type: MediaType.image,
              data: await FirebaseUtils.loadImage(data['url'] as String),
            );
          }

          throw const GetProductFailure.unknown();
        },
      ))
          .toList(),
      price: Price.fromMap(productData['price']),
      rating: productData['rating'] as double,
      countBuy: productData['count_buy'] as int,
      genre: (productData['genre'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      stylistics: (productData['stylistics'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      platforms: (productData['platforms'] as List<dynamic>)
          .map((p) => Utils.platformFromName(p))
          .toList(),
      multiplayer: (productData['multiplayer'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      localization: (await Utils.futureMap(
        await product.collection('localization').get().then((c) => c.docs),
        (doc) async {
          final data = doc.data();
          data['language'] = doc.id;
          return LocalizationProduct.fromMap(data);
        },
      ))
          .toList(),
      developer: productData['developer'] as String,
      publisher: productData['publisher'] as String,
      releaseDate: (productData['release_date'] as Timestamp).toDate(),
      links: (await Utils.futureMap(
        await product.collection('links').get().then((c) => c.docs),
        (doc) async => Link.fromMap(doc.data()),
      ))
          .toList(),
      productDlc: (await Utils.futureMap(
        await product.collection('dlc').get().then((c) => c.docs),
        (doc) async => ProductDLC.fromMap(doc.data()),
      ))
          .toList(),
      bundles: (await Utils.futureMap(
        productData['bundles'] as List<dynamic>,
        (field) async {
          final data = await (field as DocumentReference)
              .get()
              .then((doc) => doc.data() as Map<String, dynamic>);

          data['products'] = (await Utils.futureMap(
            data['products'] as List<dynamic>,
            (field) async => FirebaseUtils.packProduct(field),
          ))
              .toList();

          return Bundle.fromMap(data);
        },
      ))
          .toList(),
      systemRequirement: (await Utils.futureMap(
        await product
            .collection('system_requirement')
            .get()
            .then((c) => c.docs),
        (doc) async => SystemRequirement.fromMap(doc.data()),
      ))
          .toList(),
      productReview: (await Utils.futureMap(
        await product
            .collection('review')
            .limit(5)
            .orderBy('created_at', descending: true)
            .get()
            .then((c) => c.docs),
        (doc) async {
          final data = doc.data();

          final user = await (data['user'] as DocumentReference).get();
          final userData = user.data() as Map<String, dynamic>;

          userData['id'] = user.id;
          userData['avatar'] =
              await FirebaseUtils.loadImage(userData['avatar'] as String);

          data['user'] = userData;
          data['created_at'] = (data['created_at'] as Timestamp).toDate();

          return ProductReview.fromMap(data);
        },
      ))
          .toList(),
    );
  }

  Future<List<CompactProduct>> searchProducts(
      {required f.Filter filter}) async {
    return Future.value(debugProductList
        .where((product) => Utils.isCorrectFilter(product, filter))
        .map((product) => CompactProduct(
              id: product.id,
              title: product.title,
              banner: product.media
                      .where((element) => element.type == MediaType.image)
                      .isNotEmpty
                  ? product.media
                      .where((element) => element.type == MediaType.image)
                      .first
                  : null,
              price: product.price,
              platforms: product.platforms,
            ))
        .toList());
  }
}
