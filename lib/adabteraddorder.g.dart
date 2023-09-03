// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adabteraddorder.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class addorderAdapter extends TypeAdapter<addorder> {
  @override
  final int typeId = 1;

  @override
  addorder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return addorder(
      nameclient: fields[0] as String,
      nameprodect: fields[1] as String,
      idclient: fields[2] as int,
      idprodect: fields[3] as int,
      amount: fields[4] as double,
      priceamount: fields[5] as double,
      time: fields[6] as String,
      date: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, addorder obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.nameclient)
      ..writeByte(1)
      ..write(obj.nameprodect)
      ..writeByte(2)
      ..write(obj.idclient)
      ..writeByte(3)
      ..write(obj.idprodect)
      ..writeByte(4)
      ..write(obj.amount)
      ..writeByte(5)
      ..write(obj.priceamount)
      ..writeByte(6)
      ..write(obj.time)
      ..writeByte(7)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is addorderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
