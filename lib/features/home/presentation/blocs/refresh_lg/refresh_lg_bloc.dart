import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_task_two/features/home/domain/usecases/refresh_lg.dart';

part 'refresh_lg_event.dart';
part 'refresh_lg_state.dart';

class RefreshLgBloc extends Bloc<RefreshLgEvent, RefreshLgState> {
  final RefreshLgUseCase _refreshLgUseCase;
  RefreshLgBloc({required RefreshLgUseCase refreshLgUseCase})
      : _refreshLgUseCase = refreshLgUseCase,
        super(RefreshLgInitial()) {
    on<RefreshLg>(_onRefreshLg);
  }

  void _onRefreshLg(RefreshLg event, Emitter<RefreshLgState> emit) async {
    emit(RefreshLgLoading());
    final result = await _refreshLgUseCase(RefreshLgParams(
      client: event.client,
      numberOfRigs: event.numberOfRigs,
      password: event.password,
      refreshInterval: event.refreshInterval,
    ));
    result.fold(
      (failure) => emit(
        RefreshLgFailure(failure.message),
      ),
      (_) => emit(
        RefreshLgSuccess(),
      ),
    );
  }
}
