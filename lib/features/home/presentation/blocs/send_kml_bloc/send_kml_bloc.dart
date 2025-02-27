import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_task_two/features/home/domain/usecases/send_kml.dart';

part 'send_kml_event.dart';
part 'send_kml_state.dart';

class SendKmlBloc extends Bloc<SendKmlEvent, SendKmlState> {
  final SendKmlUseCase _sendKmlUseCase;
  SendKmlBloc({required SendKmlUseCase sendKmlUseCase})
      : _sendKmlUseCase = sendKmlUseCase,
        super(SendKmlInitial()) {
    on<SendKml>(_onSendKml);
  }

  void _onSendKml(SendKml event, Emitter<SendKmlState> emit) async {
    emit(SendKmlLoading());
    final result = await _sendKmlUseCase(
      SendKmlParams(
        event.client,
        event.kmlContent,
        event.kmlName,
      ),
    );
    result.fold(
      (failure) => emit(
        SendKmlFailure(failure.message),
      ),
      (_) => emit(
        SendKmlSuccess(),
      ),
    );
  }
}
