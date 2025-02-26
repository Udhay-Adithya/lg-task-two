import 'package:dartssh2/dartssh2.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lg_task_two/core/error/failure.dart';
import 'package:lg_task_two/core/usecase/usecase.dart';
import 'package:lg_task_two/features/home/domain/repository/home_repository.dart';

class SendLgLogoUseCase implements UseCase<void, SendLgLogoParams> {
  final HomeRepository repository;

  SendLgLogoUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.sendLgLogo(params.client);
  }
}

class SendLgLogoParams {
  final SSHClient client;

  SendLgLogoParams({
    required this.client,
  });
}
