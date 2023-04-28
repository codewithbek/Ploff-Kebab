

import 'package:json_annotation/json_annotation.dart';
import 'package:ploff_kebab/features/home/domain/entities/banner_entity/banner_promo_entity.dart';
import 'package:ploff_kebab/features/home/domain/entities/description_and_title_entity.dart';

part 'banner_promo_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BannerPromoModel extends BannerPromoEntity {
  const BannerPromoModel({
    super.createdAt,
    super.description,
    super.endTime,
    super.image,
    super.isActive,
    super.startTime,
    super.title,
  });

  factory BannerPromoModel.fromJson(Map<String, dynamic> json) => _$BannerPromoModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerPromoModelToJson(this);
}
