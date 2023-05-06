import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ploff_kebab/features/home/data/models/product_model/product_model.dart';
import 'package:ploff_kebab/features/home/domain/entities/description_and_title_entity.dart';

class ProductEntity extends Equatable {
  final String id;
  final int outPrice;
  final String currency;
  final String string;
  final String type;
  final List<String> categories;
  final String brandId;
  final String rateId;
  final String image;
  final bool activeInMenu;
  final bool hasModifier;
  final String fromTime;
  final String toTime;
  final bool offAlways;
  @DescriptionAndTitleEntityConverter()
  final DescriptionAndTitleEntity title;
  @DescriptionAndTitleEntityConverter()
  final DescriptionAndTitleEntity description;
  final bool active;
  final String iikoId;
  final String jowiId;
  final String count;
  const ProductEntity({
    this.id = '',
    this.outPrice = -1,
    this.currency = '',
    this.string = '',
    this.type = '',
    this.categories = const [],
    this.brandId = '',
    this.rateId = '',
    this.image = '',
    this.activeInMenu = false,
    this.hasModifier = false,
    this.fromTime = '',
    this.toTime = '',
    this.offAlways = false,
    this.title = const DescriptionAndTitleEntity(),
    this.description = const DescriptionAndTitleEntity(),
    this.active = true,
    this.iikoId = '',
    this.jowiId = '',
    this.count = '',
  });

  @override
  List<Object?> get props => [];
}

class ProductEntityConverter
    implements JsonConverter<ProductEntity, Map<String, dynamic>?> {
  const ProductEntityConverter();
  @override
  ProductEntity fromJson(Map<String, dynamic>? json) =>
      ProductModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(ProductEntity object) => {};
}
