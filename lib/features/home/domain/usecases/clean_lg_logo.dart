import 'package:dartssh2/dartssh2.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lg_task_two/core/error/failure.dart';
import 'package:lg_task_two/core/usecase/usecase.dart';
import 'package:lg_task_two/features/home/domain/repository/home_repository.dart';

class CleanLgLogoUseCase implements UseCase<void, CleanLgLogoParams> {
  final HomeRepository repository;

  CleanLgLogoUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.cleanLgLogo(params.client, params.numberOfRigs);
  }
}

class CleanLgLogoParams {
  final SSHClient client;
  final int numberOfRigs;

  CleanLgLogoParams(this.client, {required this.numberOfRigs});
}
