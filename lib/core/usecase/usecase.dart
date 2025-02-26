import 'package:fpdart/fpdart.dart';
import 'package:lg_task_two/core/error/failure.dart';

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
