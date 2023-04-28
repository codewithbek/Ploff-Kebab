// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel(
      count: json['count'] as int? ?? 0,
      promos: (json['promos'] as List<dynamic>?)
              ?.map((e) => const BannerPromoEntityConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'promos': instance.promos
          .map(const BannerPromoEntityConverter().toJson)
          .toList(),
    };
