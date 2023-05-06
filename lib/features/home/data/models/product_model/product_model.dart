import 'package:json_annotation/json_annotation.dart';
import 'package:ploff_kebab/features/home/domain/entities/description_and_title_entity.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_entity.dart';

part 'product_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductModel extends ProductEntity {
  const ProductModel({
    super.active,
    super.activeInMenu,
    super.brandId,
    super.categories,
    super.currency,
    super.description,
    super.fromTime,
    super.hasModifier,
    super.id,
    super.iikoId,
    super.image,
    super.jowiId,
    super.offAlways,
    super.outPrice,
    super.rateId,
    super.string,
    super.title,
    super.toTime,
    super.type,
    super.count,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
