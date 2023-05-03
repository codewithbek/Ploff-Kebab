part of "home_local_data_source.dart";

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final Box<dynamic> box;

  HomeLocalDataSourceImpl({required this.box});
  @override
  Future<bool> addProducts(List<ProductModel> products) async {
    try {
      // return articles hive box
      final productsBox = Hive.box<ProductHiveModel>(CacheKeys.product);
      // clear all enrties from hive box
      final deleted = await productsBox.clear();
      // print deleted entries
      debugPrint('delete $deleted entries from hive ${CacheKeys.product} box');
      // convert ArticleModel to HiveType Article
      final converted = products
          .map((e) => ProductHiveModel(
                id: e.id,
                active: e.active,
                activeInMenu: e.activeInMenu,
                brandId: e.brandId,
                categories: e.categories,
                currency: e.currency,
                description: e.description,
                fromTime: e.fromTime,
                hasModifier: e.hasModifier,
                iikoId: e.iikoId,
                image: e.image,
                jowiId: e.jowiId,
                offAlways: e.offAlways,
                outPrice: e.outPrice,
                rateId: e.rateId,
                string: e.string,
                title: e.title,
                toTime: e.toTime,
                type: e.type,
              ))
          .toList();
      // insert all articles to hive box
      final entries = await productsBox.addAll(converted);
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
        brandId: e.brandId,
        categories: e.categories,
        currency: e.currency,
        fromTime: e.fromTime,
        hasModifier: e.hasModifier,
        iikoId: e.iikoId,
        image: e.image,
        jowiId: e.jowiId,
        offAlways: e.offAlways,
        outPrice: e.outPrice,
        rateId: e.rateId,
        string: e.string,
        title: e.title,
        toTime: e.toTime,
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
