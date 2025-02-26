part of 'init_dependencies.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initHome();

  final appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(ConnectionDataAdapter());

  final connectionDataBox =
      await Hive.openBox<ConnectionData>('connectionData');

  serviceLocator
      .registerLazySingleton<Box<ConnectionData>>(() => connectionDataBox);
}

void _initHome() {
  serviceLocator
    ..registerFactory<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImpl(),
    )
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(
        remoteDatasource: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => RefreshLgUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SendLgLogoUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CleanLgLogoUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => RefreshLgBloc(
        refreshLgUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => SendLgLogoBloc(
        sendLgLogoUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => CleanLgLogoBloc(
        cleanLgLogoUseCase: serviceLocator(),
      ),
    );
}
