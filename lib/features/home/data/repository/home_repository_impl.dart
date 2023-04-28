import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/core/error/failure.dart';
import 'package:ploff_kebab/export_files.dart';

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
  Future<Either<Failure, CategoriesWithProductsEntity>> getCategoriesWithProducts() async {
    debugPrint('>>>>>>>>kirdi ');
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
}
