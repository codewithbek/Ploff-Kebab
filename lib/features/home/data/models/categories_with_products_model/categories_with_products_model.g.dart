// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_with_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesWithProductsModel _$CategoriesWithProductsModelFromJson(
        Map<String, dynamic> json) =>
    CategoriesWithProductsModel(
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => const CategoryEntityConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      count: json['count'] as String? ?? '',
    );

Map<String, dynamic> _$CategoriesWithProductsModelToJson(
        CategoriesWithProductsModel instance) =>
    <String, dynamic>{
      'categories': instance.categories
          .map(const CategoryEntityConverter().toJson)
          .toList(),
      'count': instance.count,
    };
