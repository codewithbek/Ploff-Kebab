import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ploff_kebab/features/home/data/models/banner_model/banner_description_model/description_and_title_model.dart';

class DescriptionAndTitleEntity extends Equatable {
  final String en;
  final String ru;
  final String uz;

  const DescriptionAndTitleEntity({
    this.en = '',
    this.ru = '',
    this.uz = '',
  });

  @override
  List<Object?> get props => [
        en,
        ru,
        uz,
      ];
}

class DescriptionAndTitleEntityConverter implements JsonConverter<DescriptionAndTitleEntity, Map<String, dynamic>?> {
  const DescriptionAndTitleEntityConverter();
  @override
  DescriptionAndTitleEntity fromJson(Map<String, dynamic>? json) => DescriptionAndTitleModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(DescriptionAndTitleEntity object) => {};
}
