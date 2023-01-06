import 'package:marketplace/domain/entity/cart_product.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/desired.dart';
import 'package:marketplace/domain/entity/filter.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/domain/entity/product.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/presentation/utils.dart' as ui_utils;

class ProductRemoteDataSource {
  Future<Map<String, List<CompactProduct>>> discoverGetProducts(
      List<Platform> platforms) async {
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

  Future<Product> getProduct(CompactProduct compactProduct) async {
    return Future.value(compactProduct.toProduct());
  }

  Future<List<CompactProduct>> searchProducts(Filter filter) async {
    return Future.value(debugProductList
        .where((product) => ui_utils.isCorrectFilter(product, filter))
        .map((product) => product.toCompactProduct())
        .toList());
  }
}
