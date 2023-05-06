import 'package:hive/hive.dart';
import 'package:ploff_kebab/core/constants/constants.dart';
import 'package:ploff_kebab/features/home/data/models/hive_model/product_hive_model.dart';

class ProductHiveService {
  Box<ProductHiveModel>? productBox;

  Future<Box<ProductHiveModel>> openbox() async {
    productBox ??= await Hive.openBox<ProductHiveModel>(CacheKeys.product);
    return productBox!;
  }

  List<ProductHiveModel> getCachedProducts(Box box) {
    return box.values.toList().cast<ProductHiveModel>();
  }

  Future<void> addProduct(Box box, ProductHiveModel cachedProductModel) async {
    await box.put(cachedProductModel.id, cachedProductModel);
  }

  Future<void> deleteAllCachedProduct(Box box) async {
    await box.clear();
  }

  Future<void> deleteCachedProductById(Box box, String id) async {
    await box.delete(id);
  }
}
