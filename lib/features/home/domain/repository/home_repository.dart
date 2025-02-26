import 'package:dartssh2/dartssh2.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lg_task_two/core/error/failure.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, void>> refreshLg(
    SSHClient client,
    int numberOfRigs,
    String password, {
    int refreshInterval = 2,
  });
  Future<Either<Failure, void>> sendKml(SSHClient client, String kmlContent);
  Future<Either<Failure, void>> sendLgLogo(SSHClient client);
  Future<Either<Failure, void>> cleanLgLogo(SSHClient client, int numberOfRigs);
  Future<Either<Failure, void>> cleanKml(SSHClient client);
}
