import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lg_task_two/core/common/ssh_connection/domain/entity/connection_data.dart';

part 'ssh_connection_state.dart';

class SSHClientCubit extends Cubit<SSHClientState> {
  SSHClientCubit() : super(SSHClientInitial()) {
    _initializeDefaultValues();
  }

  final String _connectionBoxKey = 'connectionData';

  Future<void> _initializeDefaultValues() async {
    final box = await Hive.openBox<ConnectionData>(_connectionBoxKey);
    if (!box.containsKey('connection')) {
      // Cache default values
      final defaultConnectionData = ConnectionData(
        ip: "192.168.56.103",
        username: "lg",
        password: "lqgalaxy",
        port: 22,
      );
      await box.put('connection', defaultConnectionData);
    }
  }

  Future<void> connect({
    String ip = "192.168.56.103",
    String username = "lg",
    String password = "lqgalaxy",
    int port = 22,
  }) async {
    emit(SSHClientLoading());

    try {
      final socket = await SSHSocket.connect(ip, port).timeout(
        const Duration(seconds: 10),
      );
      final client = SSHClient(
        socket,
        username: username,
        onPasswordRequest: () => password,
      );

      // Cache the connection details
      final connectionData = ConnectionData(
        ip: ip,
        username: username,
        password: password,
        port: port,
      );
      final box = await Hive.openBox<ConnectionData>(_connectionBoxKey);
      await box.put('connection', connectionData);

      emit(SSHClientSuccess(client));
    } catch (e) {
      emit(SSHClientFailure(e.toString()));
    }
  }

  Future<ConnectionData?> getCachedConnectionData() async {
    final box = await Hive.openBox<ConnectionData>(_connectionBoxKey);
    return box.get('connection');
  }

  void disconnect() {
    emit(SSHClientInitial());
  }
}
