// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      active: json['active'] as bool? ?? true,
      activeInMenu: json['active_in_menu'] as bool? ?? false,
      brandId: json['brand_id'] as String? ?? '',
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      currency: json['currency'] as String? ?? '',
      description: json['description'] == null
          ? const DescriptionAndTitleEntity()
          : const DescriptionAndTitleEntityConverter()
              .fromJson(json['description'] as Map<String, dynamic>?),
      fromTime: json['from_time'] as String? ?? '',
      hasModifier: json['has_modifier'] as bool? ?? false,
      id: json['id'] as String? ?? '',
      iikoId: json['iiko_id'] as String? ?? '',
      image: json['image'] as String? ?? '',
      jowiId: json['jowi_id'] as String? ?? '',
      offAlways: json['off_always'] as bool? ?? false,
      outPrice: json['out_price'] as int? ?? -1,
      rateId: json['rate_id'] as String? ?? '',
      string: json['string'] as String? ?? '',
      title: json['title'] == null
          ? const DescriptionAndTitleEntity()
          : const DescriptionAndTitleEntityConverter()
              .fromJson(json['title'] as Map<String, dynamic>?),
      toTime: json['to_time'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'out_price': instance.outPrice,
      'currency': instance.currency,
      'string': instance.string,
      'type': instance.type,
      'categories': instance.categories,
      'brand_id': instance.brandId,
      'rate_id': instance.rateId,
      'image': instance.image,
      'active_in_menu': instance.activeInMenu,
      'has_modifier': instance.hasModifier,
      'from_time': instance.fromTime,
      'to_time': instance.toTime,
      'off_always': instance.offAlways,
      'title':
          const DescriptionAndTitleEntityConverter().toJson(instance.title),
      'description': const DescriptionAndTitleEntityConverter()
          .toJson(instance.description),
      'active': instance.active,
      'iiko_id': instance.iikoId,
      'jowi_id': instance.jowiId,
    };
