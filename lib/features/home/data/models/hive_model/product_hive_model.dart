import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_kebab/features/home/domain/entities/description_and_title_entity.dart';

part 'product_hive_model.g.dart';

@HiveType(adapterName: "ProductAdapter", typeId: 1)
class ProductHiveModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final int outPrice;

  @HiveField(2)
  final String currency;

  @HiveField(3)
  final String string;

  @HiveField(4)
  final String type;

  @HiveField(5)
  final String orderNo;

  @HiveField(6)
  final List<String> categories;

  @HiveField(7)
  final String brandId;

  @HiveField(8)
  final String rateId;

  @HiveField(9)
  final String image;

  @HiveField(10)
  final bool activeInMenu;

  @HiveField(11)
  final bool hasModifier;

  @HiveField(12)
  final String fromTime;

  @HiveField(13)
  final String toTime;

  @HiveField(14)
  final bool offAlways;

  @HiveField(15)
  final DescriptionAndTitleEntity title;

  @HiveField(16)
  final DescriptionAndTitleEntity description;

  @HiveField(17)
  final bool active;

  @HiveField(18)
  final String iikoId;

  @HiveField(19)
  final String jowiId;

  @HiveField(20)
  
  ProductHiveModel({
    required this.id,
    this.orderNo = "",
    required this.active,
    required this.categories,
    required this.outPrice,
    required this.currency,
    required this.string,
    required this.type,
    required this.brandId,
    required this.rateId,
    required this.image,
    required this.activeInMenu,
    required this.hasModifier,
    required this.fromTime,
    required this.toTime,
    required this.offAlways,
    required this.title,
    required this.description,
    required this.iikoId,
    required this.jowiId,
  });
}
