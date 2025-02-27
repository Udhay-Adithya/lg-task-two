import 'package:dartssh2/dartssh2.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lg_task_two/core/error/failure.dart';
import 'package:lg_task_two/core/usecase/usecase.dart';
import 'package:lg_task_two/features/home/domain/repository/home_repository.dart';

class CleanKmlUseCase implements UseCase<void, CleanKmlParams> {
  final HomeRepository repository;

  CleanKmlUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.cleanKml(params.client);
  }
}

class CleanKmlParams {
  final SSHClient client;

  CleanKmlParams(this.client);
}
