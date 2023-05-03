// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<ProductHiveModel> {
  @override
  final int typeId = 1;

  @override
  ProductHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductHiveModel(
      id: fields[0] as String,
      orderNo: fields[5] as String,
      active: fields[17] as bool,
      categories: (fields[6] as List).cast<String>(),
      outPrice: fields[1] as int,
      currency: fields[2] as String,
      string: fields[3] as String,
      type: fields[4] as String,
      brandId: fields[7] as String,
      rateId: fields[8] as String,
      image: fields[9] as String,
      activeInMenu: fields[10] as bool,
      hasModifier: fields[11] as bool,
      fromTime: fields[12] as String,
      toTime: fields[13] as String,
      offAlways: fields[14] as bool,
      title: fields[15] as DescriptionAndTitleEntity,
      description: fields[16] as DescriptionAndTitleEntity,
      iikoId: fields[18] as String,
      jowiId: fields[19] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductHiveModel obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.outPrice)
      ..writeByte(2)
      ..write(obj.currency)
      ..writeByte(3)
      ..write(obj.string)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.orderNo)
      ..writeByte(6)
      ..write(obj.categories)
      ..writeByte(7)
      ..write(obj.brandId)
      ..writeByte(8)
      ..write(obj.rateId)
      ..writeByte(9)
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.activeInMenu)
      ..writeByte(11)
      ..write(obj.hasModifier)
      ..writeByte(12)
      ..write(obj.fromTime)
      ..writeByte(13)
      ..write(obj.toTime)
      ..writeByte(14)
      ..write(obj.offAlways)
      ..writeByte(15)
      ..write(obj.title)
      ..writeByte(16)
      ..write(obj.description)
      ..writeByte(17)
      ..write(obj.active)
      ..writeByte(18)
      ..write(obj.iikoId)
      ..writeByte(19)
      ..write(obj.jowiId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
