// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClassAddressAdapter extends TypeAdapter<ClassAddress> {
  @override
  final int typeId = 3;

  @override
  ClassAddress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClassAddress(
      blocNumber: fields[0] as int,
      roomNumber: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ClassAddress obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.blocNumber)
      ..writeByte(1)
      ..write(obj.roomNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClassAddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
