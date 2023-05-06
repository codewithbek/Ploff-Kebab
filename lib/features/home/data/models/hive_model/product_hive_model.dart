import 'package:hive_flutter/hive_flutter.dart';

part 'product_hive_model.g.dart';

@HiveType(adapterName: "ProductAdapter", typeId: 1)
class ProductHiveModel extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late int outPrice;

  @HiveField(2)
  late String currency;

  @HiveField(3)
  late String type;

  @HiveField(4)
  late String image;

  @HiveField(5)
  late bool activeInMenu;

  @HiveField(6)
  late bool hasModifier;

  @HiveField(7)
  late String title;

  @HiveField(8)
  late String description;

  @HiveField(9)
  late bool active;

  @HiveField(10)
  String? count;
}

  // ProductHiveModel({
  //   required this.id,
  //   this.orderNo = "",
  //   required this.active,
  //   required this.categories,
  //   required this.outPrice,
  //   required this.currency,
  //   required this.string,
  //   required this.type,
  //   required this.brandId,
  //   required this.rateId,
  //   required this.image,
  //   required this.activeInMenu,
  //   required this.hasModifier,
  //   required this.fromTime,
  //   required this.toTime,
  //   required this.offAlways,
  //   required this.title,
  //   required this.description,
  //   required this.iikoId,
  //   required this.jowiId,
  // });

