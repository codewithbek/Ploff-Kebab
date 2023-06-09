import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_entity.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, BannerEntity>> getBanners() async {
    bool isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(NoInternetFailure());
    }
    try {
      final response = await remoteDataSource.getBanners();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesWithProductsEntity>>
      getCategoriesWithProducts() async {
    debugPrint('CategoryWithProductga kirdi >>>>>>>> ');
    bool isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(NoInternetFailure());
    }
    try {
      final response = await remoteDataSource.getCategoriesWithProducts();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductBy(
      {required String productId}) async {
    debugPrint('Product By Idga kirdi >>>>>>>> ');
    bool isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(NoInternetFailure());
    }
    try {
      final response =
          await remoteDataSource.getProductById(productId: productId);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
