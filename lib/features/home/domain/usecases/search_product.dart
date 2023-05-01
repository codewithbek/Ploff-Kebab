import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/core/error/failure.dart';
import 'package:ploff_kebab/core/usecase/usecase.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_list_entity.dart';
import 'package:ploff_kebab/features/home/domain/repository/home_repository.dart';

class SearchProductUseCase
    extends UseCase<ProductListEntity, SearchProductParams> {
  final HomeRepository repository;

  SearchProductUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductListEntity>> call(params) async {
    final response =
        await repository.searchProduct(productId: params.productId);
    return response;
  }
}

class SearchProductParams {
  final String productId;
  SearchProductParams({required this.productId});
}
