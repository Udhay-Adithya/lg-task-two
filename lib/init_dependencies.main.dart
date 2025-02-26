part of 'init_dependencies.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  await _initSSHClient();
  _initConnection();

  final appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(ConnectionDataAdapter());

  final connectionDataBox = await Hive.openBox<ConnectionData>('userBox');

  serviceLocator
      .registerLazySingleton<Box<ConnectionData>>(() => connectionDataBox);
}

Future<void> _initSSHClient({
  String host = "192.168.56.103",
  String username = "lg",
  int port = 22,
  String password = "lqgalaxy",
}) async {
  try {
    final socket = await SSHSocket.connect(host, port).timeout(
      const Duration(milliseconds: 2000),
    );
    final client = SSHClient(
      socket,
      username: username,
      onPasswordRequest: () => password,
      printDebug: (p0) => log(p0.toString()),
    );
    serviceLocator.registerLazySingleton(
      () => client,
    );
  } catch (e) {
    log('Failed to initialize SSH client: $e');
  }
}

void _initConnection() {}
