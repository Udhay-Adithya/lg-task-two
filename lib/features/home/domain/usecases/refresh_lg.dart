import 'package:dartssh2/dartssh2.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lg_task_two/core/error/failure.dart';
import 'package:lg_task_two/core/usecase/usecase.dart';
import 'package:lg_task_two/features/home/domain/repository/home_repository.dart';

class RefreshLgUseCase implements UseCase<void, RefreshLgParams> {
  final HomeRepository repository;

  RefreshLgUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.refreshLg(
      params.client,
      params.numberOfRigs,
      params.password,
      refreshInterval: params.refreshInterval,
    );
  }
}

class RefreshLgParams {
  final SSHClient client;
  final int numberOfRigs;
  final String password;
  final int refreshInterval;

  RefreshLgParams({
    required this.client,
    required this.numberOfRigs,
    required this.password,
    this.refreshInterval = 2,
  });
}
