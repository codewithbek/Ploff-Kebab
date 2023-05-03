import 'dart:convert';

import 'package:ploff_kebab/core/error/exceptions.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/data/models/banner_model/banner_model.dart';
import 'package:ploff_kebab/features/home/data/models/categories_with_products_model/categories_with_products_model.dart';
import 'package:ploff_kebab/features/home/data/models/hive_model/product_hive_model.dart';

part 'home_local_data_source_impl.dart';

abstract class HomeLocalDataSource {
  
  Future<bool> initDb();
  Future<bool> deleteDb();
  Future<bool> addProducts(List<ProductHiveModel> products);
  Future<bool> deleteAllProducts();
  Future<List<ProductModel>> getProducts();
}
