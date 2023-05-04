import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/data/models/hive_model/product_hive_model.dart';
import 'package:ploff_kebab/service/product_hive_service.dart';

class CachedProducts {
  CachedProducts({required ProductHiveService hiveService})
      : _hiveService = hiveService;

  final ProductHiveService _hiveService;

  Future<void> addProduct({required ProductModel productModel}) async {
    var box = await _hiveService.openbox();

    await _hiveService.addProduct(
        box,
        ProductHiveModel()
          ..id = productModel.id
          ..title = productModel.title.uz
          ..outPrice = productModel.outPrice
          ..active = productModel.active
          ..activeInMenu = productModel.activeInMenu
          ..image = productModel.image
          ..description = productModel.description.uz
          ..type = productModel.type
          ..currency = productModel.currency
          ..hasModifier = productModel.hasModifier);
  }

  Future<List<ProductHiveModel>> getCachedProducts() async {
    var box = await _hiveService.openbox();
    return _hiveService.getCachedProducts(box);
  }

  Future<void> deleteAllCachedProduct() async {
    var box = await _hiveService.openbox();
    return _hiveService.deleteAllCachedProduct(box);
  }
  Future<void> deleteCachedProductById(String id) async {
    var box = await _hiveService.openbox();
    return _hiveService.deleteCachedProductById(box, id);
  }
}
