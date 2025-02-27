import 'package:dartssh2/dartssh2.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lg_task_two/core/error/failure.dart';
import 'package:lg_task_two/core/usecase/usecase.dart';
import 'package:lg_task_two/features/home/domain/repository/home_repository.dart';

class SendKmlUseCase implements UseCase<void, SendKmlParams> {
  final HomeRepository repository;

  SendKmlUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(SendKmlParams params) async {
    return await repository.sendKml(
        params.client, params.kmlContent, params.kmlName);
  }
}

class SendKmlParams {
  final SSHClient client;
  final String kmlContent;
  final String kmlName;

  SendKmlParams(
    this.client,
    this.kmlContent,
    this.kmlName,
  );
}
