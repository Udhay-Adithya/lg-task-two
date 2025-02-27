import 'package:dartssh2/dartssh2.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lg_task_two/core/error/exceptions.dart';
import 'package:lg_task_two/core/error/failure.dart';
import 'package:lg_task_two/features/home/data/datasources/home_remote_datasource.dart';
import 'package:lg_task_two/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource remoteDatasource;

  HomeRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, void>> cleanKml(SSHClient client) async {
    try {
      final resp = await remoteDatasource.cleanKml(client);

      return right(resp);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    } on Exception catch (e) {
      return left(
        Failure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, void>> cleanLgLogo(
    SSHClient client,
    int numberOfRigs,
  ) async {
    try {
      final resp = await remoteDatasource.cleanLgLogo(client, numberOfRigs);

      return right(resp);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    } on Exception catch (e) {
      return left(
        Failure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, void>> refreshLg(
    SSHClient client,
    int numberOfRigs,
    String password, {
    int refreshInterval = 2,
  }) async {
    try {
      final resp = await remoteDatasource.refreshLg(
        client,
        numberOfRigs,
        password,
        refreshInterval: refreshInterval,
      );

      return right(resp);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    } on Exception catch (e) {
      return left(
        Failure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, void>> sendKml(
    SSHClient client,
    String kmlContent,
    String kmlName,
  ) async {
    try {
      final resp = await remoteDatasource.sendKml(client, kmlContent, kmlName);

      return right(resp);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    } on Exception catch (e) {
      return left(
        Failure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, void>> sendLgLogo(SSHClient client) async {
    try {
      final resp = await remoteDatasource.sendLgLogo(client);

      return right(resp);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    } on Exception catch (e) {
      return left(
        Failure(e.toString()),
      );
    }
  }
}
