import 'package:json_annotation/json_annotation.dart';
import 'package:ploff_kebab/features/home/domain/entities/category_entity/categories_with_products_entity.dart';
import 'package:ploff_kebab/features/home/domain/entities/category_entity/category_entity.dart';
part 'categories_with_products_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoriesWithProductsModel extends CategoriesWithProductsEntity {
  const CategoriesWithProductsModel({
    super.categories,
    super.count,
  });

  factory CategoriesWithProductsModel.fromJson(Map<String, dynamic> json) => _$CategoriesWithProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesWithProductsModelToJson(this);
}
