part of "home_local_data_source.dart";

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final Box<dynamic> box;

  HomeLocalDataSourceImpl({required this.box});
  @override
  Future<bool> addProducts(ProductModel products) async {
    try {
      final converted = ProductHiveModel()
        ..id = products.id
        ..title = products.title
        ..outPrice = products.outPrice
        ..active = products.active
        ..activeInMenu = products.activeInMenu
        ..image = products.image
        ..description = products.description
        ..type = products.type
        ..currency = products.currency
        ..hasModifier = products.hasModifier;

      // insert all articles to hive box
      final entries = await box.add(converted);
      debugPrint(entries.toString());
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteAllProducts() async {
    try {
      // return articles hive box
      final productsBox = Hive.box<ProductHiveModel>(CacheKeys.product);
      // clear all enrties from hive box
      final deleted = await productsBox.clear();
      // print deleted entries
      debugPrint('delete $deleted entries from hive ${CacheKeys.product} box');
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteDb() {
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final productsBox = Hive.box<ProductHiveModel>(CacheKeys.product);
    return productsBox.values.map<ProductModel>((e) {
      return ProductModel(
        id: e.id,
        active: e.active,
        activeInMenu: e.activeInMenu,
        currency: e.currency,
        image: e.image,
        outPrice: e.outPrice,
        title: e.title,
        type: e.type,
      );
    }).toList();
  }

  @override
  Future<bool> initDb() async {
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
      Hive.registerAdapter(ProductAdapter());
      await Hive.openBox<ProductHiveModel>(CacheKeys.product);
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
