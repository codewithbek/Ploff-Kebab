import 'package:ploff_kebab/features/home/domain/entities/banner_entity/banner_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ploff_kebab/features/home/domain/entities/banner_entity/banner_promo_entity.dart';

part 'banner_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BannerModel extends BannerEntity {
  const BannerModel({super.count, super.promos});

  factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}