// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListModel _$ProductListModelFromJson(Map<String, dynamic> json) =>
    ProductListModel(
      response: (json['response'] as List<dynamic>?)
          ?.map((e) => const ProductEntityConverter()
              .fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$ProductListModelToJson(ProductListModel instance) =>
    <String, dynamic>{
      'response': instance.response
          ?.map(const ProductEntityConverter().toJson)
          .toList(),
    };
