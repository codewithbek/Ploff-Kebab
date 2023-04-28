// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_promo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerPromoModel _$BannerPromoModelFromJson(Map<String, dynamic> json) =>
    BannerPromoModel(
      createdAt: json['created_at'] as String? ?? '',
      description: json['description'] == null
          ? const DescriptionAndTitleEntity()
          : const DescriptionAndTitleEntityConverter()
              .fromJson(json['description'] as Map<String, dynamic>?),
      endTime: json['end_time'] as String? ?? '',
      image: json['image'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? true,
      startTime: json['start_time'] as String? ?? '',
      title: json['title'] == null
          ? const DescriptionAndTitleEntity()
          : const DescriptionAndTitleEntityConverter()
              .fromJson(json['title'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$BannerPromoModelToJson(BannerPromoModel instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'description': const DescriptionAndTitleEntityConverter()
          .toJson(instance.description),
      'end_time': instance.endTime,
      'image': instance.image,
      'is_active': instance.isActive,
      'start_time': instance.startTime,
      'title':
          const DescriptionAndTitleEntityConverter().toJson(instance.title),
    };
