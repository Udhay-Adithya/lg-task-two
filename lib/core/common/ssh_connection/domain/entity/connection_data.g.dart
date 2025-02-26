// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConnectionDataAdapter extends TypeAdapter<ConnectionData> {
  @override
  final int typeId = 0;

  @override
  ConnectionData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConnectionData(
      ip: fields[0] as String,
      username: fields[1] as String,
      password: fields[2] as String,
      port: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ConnectionData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ip)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.port);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectionDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
