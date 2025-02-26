import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_task_two/features/home/domain/usecases/clean_lg_logo.dart';

part 'clean_lg_logo_event.dart';
part 'clean_lg_logo_state.dart';

class CleanLgLogoBloc extends Bloc<CleanLgLogoEvent, CleanLgLogoState> {
  final CleanLgLogoUseCase _cleanLgLogoUseCase;
  CleanLgLogoBloc({required CleanLgLogoUseCase cleanLgLogoUseCase})
      : _cleanLgLogoUseCase = cleanLgLogoUseCase,
        super(CleanLgLogoInitial()) {
    on<CleanLgLogo>(_onCleanLgLogo);
  }
  void _onCleanLgLogo(CleanLgLogo event, Emitter<CleanLgLogoState> emit) async {
    emit(CleanLgLogoLoading());
    final result = await _cleanLgLogoUseCase(CleanLgLogoParams(
      event.client,
      numberOfRigs: event.numberOfRigs,
    ));
    result.fold(
      (failure) => emit(
        CleanLgLogoFailure(failure.message),
      ),
      (_) => emit(
        CleanLgLogoSuccess(),
      ),
    );
  }
}
