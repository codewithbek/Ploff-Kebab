import 'package:json_annotation/json_annotation.dart';
import 'package:ploff_kebab/features/home/domain/entities/category_entity/category_entity.dart';
import 'package:ploff_kebab/features/home/domain/entities/description_and_title_entity.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_entity.dart';


part 'category_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoryModel extends CategoryEntity {
  const CategoryModel({
    super.active,
    super.description,
    super.id,
    super.image,
    super.orderNo,
    super.parentId,
    super.products,
    super.slug,
    super.title,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
