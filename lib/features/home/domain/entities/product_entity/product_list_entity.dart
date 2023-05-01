import 'package:equatable/equatable.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_entity.dart';

class ProductListEntity extends Equatable {
  @ProductEntityConverter()
  final List<ProductEntity>? response;
  const ProductListEntity({required this.response});
  @override
  List<Object?> get props => [response];
}
