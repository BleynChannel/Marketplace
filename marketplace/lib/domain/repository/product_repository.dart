import 'package:dartz/dartz.dart';
import 'package:marketplace/core/error/user/discover_get_products_failure.dart';
import 'package:marketplace/core/error/user/get_cart_products_failure.dart';
import 'package:marketplace/core/error/user/get_desired_failure.dart';
import 'package:marketplace/core/error/user/get_notifications_failure.dart';
import 'package:marketplace/core/error/user/get_product_failure.dart';
import 'package:marketplace/core/error/user/search_products_failure.dart';
import 'package:marketplace/data/datasource/product/product_remote_data_source.dart';
import 'package:marketplace/domain/entity/cart_product.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/desired.dart';
import 'package:marketplace/domain/entity/filter.dart';
import 'package:marketplace/domain/entity/notification.dart';
import 'package:marketplace/domain/entity/product.dart';

class ProductRepository {
  final _remoteDataSource = ProductRemoteDataSource();

  Future<Either<DiscoverGetProductsFailure, Map<String, List<CompactProduct>>>>
      discoverGetProducts() async {
    try {
      final result = await _remoteDataSource.discoverGetProducts();
      return Right(result);
    } catch (_) {
      return const Left(DiscoverGetProductsFailure.unknown());
    }
  }

  Future<Either<GetCartProductsFailure, List<CartProduct>>>
      getCartProducts() async {
    try {
      final result = await _remoteDataSource.getCartProducts();
      return Right(result);
    } catch (_) {
      return const Left(GetCartProductsFailure.unknown());
    }
  }

  Future<Either<GetDesiredFailure, List<Desired>>> getDesired() async {
    try {
      final result = await _remoteDataSource.getDesired();
      return Right(result);
    } catch (_) {
      return const Left(GetDesiredFailure.unknown());
    }
  }

  Future<Either<GetNotificationsFailure, List<Notification>>>
      getNotifications() async {
    try {
      final result = await _remoteDataSource.getNotifications();
      return Right(result);
    } catch (_) {
      return const Left(GetNotificationsFailure.unknown());
    }
  }

  Future<Either<GetProductFailure, Product>> getProduct(
      CompactProduct compactProduct) async {
    try {
      final result = await _remoteDataSource.getProduct(compactProduct);
      return Right(result);
    } catch (_) {
      return const Left(GetProductFailure.unknown());
    }
  }

  Future<Either<SearchProductsFailure, List<CompactProduct>>> searchProducts(
      Filter filter) async {
    try {
      final result = await _remoteDataSource.searchProducts(filter);
      return Right(result);
    } catch (_) {
      return const Left(SearchProductsFailure.unknown());
    }
  }
}
