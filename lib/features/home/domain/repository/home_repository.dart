import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/core/error/failure.dart';
import 'package:ploff_kebab/features/home/domain/entities/banner_entity/banner_entity.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_entity.dart';

import '../entities/category_entity/categories_with_products_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, CategoriesWithProductsEntity>>
      getCategoriesWithProducts();

  Future<Either<Failure, BannerEntity>> getBanners();
  Future<Either<Failure, ProductEntity>> getProductBy({ required String productId});
}
