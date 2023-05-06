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
    return ProductHiveModel()
      ..id = fields[0] as String
      ..outPrice = fields[1] as int
      ..currency = fields[2] as String
      ..type = fields[3] as String
      ..image = fields[4] as String
      ..activeInMenu = fields[5] as bool
      ..hasModifier = fields[6] as bool
      ..title = fields[7] as String
      ..description = fields[8] as String
      ..active = fields[9] as bool
      ..count = fields[10] as String?;
  }

  @override
  void write(BinaryWriter writer, ProductHiveModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.outPrice)
      ..writeByte(2)
      ..write(obj.currency)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.activeInMenu)
      ..writeByte(6)
      ..write(obj.hasModifier)
      ..writeByte(7)
      ..write(obj.title)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.active)
      ..writeByte(10)
      ..write(obj.count);
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
