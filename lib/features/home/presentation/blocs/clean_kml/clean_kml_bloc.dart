import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_task_two/features/home/domain/usecases/clean_kml.dart';

part 'clean_kml_event.dart';
part 'clean_kml_state.dart';

class CleanKmlBloc extends Bloc<CleanKmlEvent, CleanKmlState> {
  final CleanKmlUseCase _cleanLgLogoUseCase;
  CleanKmlBloc({required CleanKmlUseCase cleanLgLogoUseCase})
      : _cleanLgLogoUseCase = cleanLgLogoUseCase,
        super(CleanKmlInitial()) {
    on<CleanKml>(_onCleanKml);
  }
  void _onCleanKml(CleanKml event, Emitter<CleanKmlState> emit) async {
    emit(CleanKmlLoading());
    final result = await _cleanLgLogoUseCase(
      CleanKmlParams(
        event.client,
      ),
    );
    result.fold(
      (failure) => emit(
        CleanKmlFailure(failure.message),
      ),
      (_) => emit(
        CleanKmlSuccess(),
      ),
    );
  }
}
