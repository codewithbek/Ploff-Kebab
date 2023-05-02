part of 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl({required this.dio});

  @override
  Future<BannerModel> getBanners() async {
    try {
      final response = await dio.get(
        "${Constants.baseUrl}${Urls.GET_BANNER_URL}",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return BannerModel.fromJson(response.data);
      }
      throw ServerException.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw ServerException(message: Validations.SOMETHING_WENT_WRONG);
    }
  }

  @override
  Future<CategoriesWithProductsModel> getCategoriesWithProducts() async {
    try {
      final response = await dio.get(
        "${Constants.baseUrl}${Urls.GET_CATEGORIES_WITH_PRODUCTS_URL}",options: Options(headers: {
          
        })
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CategoriesWithProductsModel.fromJson(response.data);
      }
      throw ServerException.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw ServerException(message: Validations.SOMETHING_WENT_WRONG);
    }
  }

  @override
  Future<ProductListModel> searchProduct({String? productId}) async {
    try {
      final response = await dio.get(
        "${Constants.baseUrl}${Urls.SEARCH_PRODUCT}$productId",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProductListModel.fromJson(response.data);
      }
      throw ServerException.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw ServerException(message: Validations.SOMETHING_WENT_WRONG);
    }
  }
}