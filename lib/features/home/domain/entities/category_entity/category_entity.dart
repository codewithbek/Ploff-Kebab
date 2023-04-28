// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ploff_kebab/features/home/data/models/category_model/category_model.dart';
import 'package:ploff_kebab/features/home/domain/entities/description_and_title_entity.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_entity.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String slug;
  final String parentId;
  final String image;
  @DescriptionAndTitleEntityConverter()
  final DescriptionAndTitleEntity description;
  @DescriptionAndTitleEntityConverter()
  final DescriptionAndTitleEntity title;
  final String orderNo;
  final bool active;
  @ProductEntityConverter()
  final List<ProductEntity> products;

  const CategoryEntity({
    this.id = '',
    this.slug = '',
    this.parentId = '',
    this.image = '',
    this.description = const DescriptionAndTitleEntity(),
    this.title = const DescriptionAndTitleEntity(),
    this.orderNo = '',
    this.active = true,
    this.products = const <ProductEntity>[],
  });

  @override
  List<Object?> get props => [
        id,
        slug,
        parentId,
        image,
        description,
        title,
        orderNo,
        active,
        products,
      ];
}

class CategoryEntityConverter
    implements JsonConverter<CategoryEntity, Map<String, dynamic>?> {
  const CategoryEntityConverter();
  @override
  CategoryEntity fromJson(Map<String, dynamic>? json) =>
      CategoryModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(CategoryEntity object) => {};
}
