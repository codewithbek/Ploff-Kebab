part of "home_local_data_source.dart";

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final Box<dynamic> box;

  HomeLocalDataSourceImpl({required this.box});

  @override
  Future<CategoriesWithProductsModel> getCategoriesWithProducts() async {
    final json = await box.get(
      CacheKeys.categoryWithProduct,
      defaultValue: null,
    );
    if (json != null) {
      return CategoriesWithProductsModel.fromJson(jsonDecode(json));
    } else {
      throw CacheException(message: Validations.SOMETHING_WENT_WRONG);
    }
  }

  @override
  Future<ProductModel> getProduct() async {
    final json = await box.get(
      CacheKeys.product,
      defaultValue: null,
    );
    if (json != null) {
      return ProductModel.fromJson(jsonDecode(json));
    } else {
      throw CacheException(message: Validations.SOMETHING_WENT_WRONG);
    }
  }

  @override
  Future<BannerModel> getBanners() async {
    final json = await box.get(
      CacheKeys.banners,
      defaultValue: null,
    );
    if (json != null) {
      return BannerModel.fromJson(jsonDecode(json));
    } else {
      throw CacheException(message: Validations.SOMETHING_WENT_WRONG);
    }
  }

  @override
  Future<void> setCategoriesWithProducts(
      CategoriesWithProductsModel response) async {
    final json = jsonEncode(response.toJson());
    await box.put(CacheKeys.categoryWithProduct, json);
  }

  @override
  Future<void> setBanners(BannerModel response) async {
    final json = jsonEncode(response.toJson());
    await box.put(CacheKeys.banners, json);
  }

  @override
  Future<void> setProduct(ProductModel response) async {
    final json = jsonEncode(response.toJson());
    await box.put(CacheKeys.product, json);
  }
}
