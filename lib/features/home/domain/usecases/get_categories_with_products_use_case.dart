import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/core/error/failure.dart';
import 'package:ploff_kebab/core/usecase/usecase.dart';
import 'package:ploff_kebab/features/home/domain/repository/home_repository.dart';
import '../entities/category_entity/categories_with_products_entity.dart';

class GetCategoriesWithProductsUseCase extends UseCase<CategoriesWithProductsEntity, NoParams> {
  final HomeRepository repository;

  GetCategoriesWithProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, CategoriesWithProductsEntity>> call(NoParams params) async {
    final response = await repository.getCategoriesWithProducts();
    return response;
  }
}
