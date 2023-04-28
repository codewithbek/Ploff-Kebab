import 'package:ploff_kebab/core/error/exceptions.dart';
import 'package:ploff_kebab/features/home/data/models/banner_model/banner_model.dart';
import 'package:ploff_kebab/features/home/data/models/categories_with_products_model/categories_with_products_model.dart';
import 'package:ploff_kebab/export_files.dart';

part 'home_remote_data_source_impl.dart';

abstract class HomeRemoteDataSource {
  Future<CategoriesWithProductsModel> getCategoriesWithProducts();

  Future<BannerModel> getBanners();
}
