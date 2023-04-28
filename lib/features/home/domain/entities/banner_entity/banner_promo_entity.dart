import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ploff_kebab/features/home/data/models/banner_model/banner_promo_model/banner_promo_model.dart';
import 'package:ploff_kebab/features/home/domain/entities/description_and_title_entity.dart';

class BannerPromoEntity extends Equatable {
  final String createdAt;
  @DescriptionAndTitleEntityConverter()
  final DescriptionAndTitleEntity description;
  final String endTime;
  final String image;
  final bool isActive;
  final String startTime;
  @DescriptionAndTitleEntityConverter()
  final DescriptionAndTitleEntity title;

  const BannerPromoEntity({
    this.createdAt = '',
    this.description = const DescriptionAndTitleEntity(),
    this.endTime = '',
    this.image = '',
    this.isActive = true,
    this.startTime = '',
    this.title = const DescriptionAndTitleEntity(),
  });

  @override
  List<Object?> get props => [
        createdAt,
        description,
        endTime,
        image,
        isActive,
        startTime,
        title,
      ];
}

class BannerPromoEntityConverter
    implements JsonConverter<BannerPromoEntity, Map<String, dynamic>?> {
  const BannerPromoEntityConverter();
  @override
  BannerPromoEntity fromJson(Map<String, dynamic>? json) =>
      BannerPromoModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(BannerPromoEntity object) => {};
}
