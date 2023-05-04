import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/data/models/hive_model/product_hive_model.dart';

part 'home_local_data_source_impl.dart';

abstract class HomeLocalDataSource {
  Future<bool> initDb();
  Future<bool> deleteDb();
  Future<bool> addProducts(ProductModel products);
  Future<bool> deleteAllProducts();
  Future<List<ProductModel>> getProducts();
}
