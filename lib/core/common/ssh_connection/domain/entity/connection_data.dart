import 'package:hive/hive.dart';

part 'connection_data.g.dart';

@HiveType(typeId: 0)
class ConnectionData {
  @HiveField(0)
  final String ip;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final int port;

  ConnectionData({
    required this.ip,
    required this.username,
    required this.password,
    required this.port,
  });
}