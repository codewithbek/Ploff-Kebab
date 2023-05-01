import 'package:json_annotation/json_annotation.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_list_entity.dart';

part 'product_list_model.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class ProductListModel extends ProductListEntity {
  const ProductListModel({
    super.response,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListModelToJson(this);
}
