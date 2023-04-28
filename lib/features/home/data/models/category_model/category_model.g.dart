// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      active: json['active'] as bool? ?? true,
      description: json['description'] == null
          ? const DescriptionAndTitleEntity()
          : const DescriptionAndTitleEntityConverter()
              .fromJson(json['description'] as Map<String, dynamic>?),
      id: json['id'] as String? ?? '',
      image: json['image'] as String? ?? '',
      orderNo: json['order_no'] as String? ?? '',
      parentId: json['parent_id'] as String? ?? '',
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => const ProductEntityConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const <ProductEntity>[],
      slug: json['slug'] as String? ?? '',
      title: json['title'] == null
          ? const DescriptionAndTitleEntity()
          : const DescriptionAndTitleEntityConverter()
              .fromJson(json['title'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'parent_id': instance.parentId,
      'image': instance.image,
      'description': const DescriptionAndTitleEntityConverter()
          .toJson(instance.description),
      'title':
          const DescriptionAndTitleEntityConverter().toJson(instance.title),
      'order_no': instance.orderNo,
      'active': instance.active,
      'products':
          instance.products.map(const ProductEntityConverter().toJson).toList(),
    };
