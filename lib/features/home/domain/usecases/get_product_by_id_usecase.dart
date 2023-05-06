import 'package:dartz/dartz.dart';

import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_entity.dart';

class GetProductByIdUseCase
    extends UseCase<ProductEntity, GetProductByIdParams> {
  final HomeRepository repository;

  GetProductByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductEntity>> call(
      GetProductByIdParams params) async {
    final response = await repository.getProductBy(productId: params.productId);
    return response;
  }
}

class GetProductByIdParams extends Equatable {
  final String productId;

  const GetProductByIdParams({required this.productId});

  @override
  List<Object?> get props => [productId];
}
