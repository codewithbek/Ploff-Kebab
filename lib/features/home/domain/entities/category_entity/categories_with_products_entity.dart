import 'package:equatable/equatable.dart';
import 'package:ploff_kebab/features/home/domain/entities/category_entity/category_entity.dart';

class CategoriesWithProductsEntity extends Equatable {
  @CategoryEntityConverter()
  final List<CategoryEntity> categories;
  final String count;

  const CategoriesWithProductsEntity({
    this.categories = const [],
    this.count = '',
  });

  @override
  List<Object?> get props => [
        categories,
        count,
      ];
}
