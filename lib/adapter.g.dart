// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class prodectAdapter extends TypeAdapter<prodect> {
  @override
  final int typeId = 0;

  @override
  prodect read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return prodect(
      nameprodect: fields[0] as String,
      priceprodect: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, prodect obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nameprodect)
      ..writeByte(1)
      ..write(obj.priceprodect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is prodectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
