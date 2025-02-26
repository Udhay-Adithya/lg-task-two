part of 'init_dependencies.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  await _initSSHClient();
  _initConnection();

  final appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  // Hive.registerAdapter(ConnectionAdapter());
  // Hive.registerAdapter(ConnectionDataAdapter());

  // final userBox = await Hive.openBox<Connection>('userBox');

  // serviceLocator.registerLazySingleton<Box<Connection>>(() => userBox);

  final client = SSHClient(
    await SSHSocket.connect('localhost', 22),
    username: '<username>',
    onPasswordRequest: () => '<password>',
  );
  serviceLocator.registerLazySingleton(
    () => client,
  );
}

Future<void> _initSSHClient({
  String localhost = "192.168.56.103",
  String username = "lg",
  int port = 22,
  String password = "lqgalaxy",
}) async {
  if (false) {
    try {
      final client = SSHClient(
        await SSHSocket.connect(localhost, port),
        username: username,
        onPasswordRequest: () => password,
      );
      serviceLocator.registerLazySingleton(
        () => client,
      );
    } on Exception catch (e) {}
  }
}

void _initConnection() {}
