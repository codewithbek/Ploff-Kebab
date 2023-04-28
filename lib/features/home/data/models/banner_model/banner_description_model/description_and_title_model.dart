import 'package:json_annotation/json_annotation.dart';
import 'package:ploff_kebab/features/home/domain/entities/description_and_title_entity.dart';

part 'description_and_title_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DescriptionAndTitleModel extends DescriptionAndTitleEntity {
  const DescriptionAndTitleModel({super.en, super.ru, super.uz});

  factory DescriptionAndTitleModel.fromJson(Map<String, dynamic> json) => _$DescriptionAndTitleModelFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionAndTitleModelToJson(this);
}
