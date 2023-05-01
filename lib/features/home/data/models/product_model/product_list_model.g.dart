// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListModel _$ProductListModelFromJson(Map<String, dynamic> json) =>
    ProductListModel(
      response: (json['products'] as List<ProductEntity>?)
          ?.map((e) => const ProductEntityConverter()
              .fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$ProductListModelToJson(ProductListModel instance) =>
    <String, dynamic>{
      'products': instance.response
          ?.map(const ProductEntityConverter().toJson)
          .toList(),
    };
