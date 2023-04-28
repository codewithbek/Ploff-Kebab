// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:ploff_kebab/features/home/domain/entities/banner_entity/banner_promo_entity.dart';

class BannerEntity extends Equatable {
  final int count;
  @BannerPromoEntityConverter()
  final List<BannerPromoEntity> promos;

  const BannerEntity({
     this.count = 0,
     this.promos = const [],
  });

  @override
  List<Object?> get props => [
        count,
        promos,
      ];
}
