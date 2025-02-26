import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_task_two/features/home/domain/usecases/send_lg_logo.dart';

part 'send_lg_logo_event.dart';
part 'send_lg_logo_state.dart';

class SendLgLogoBloc extends Bloc<SendLgLogoEvent, SendLgLogoState> {
  final SendLgLogoUseCase _sendLgLogoUseCase;
  SendLgLogoBloc({required SendLgLogoUseCase sendLgLogoUseCase})
      : _sendLgLogoUseCase = sendLgLogoUseCase,
        super(SendLgLogoInitial()) {
    on<SendLgLogo>(_onSendLgLogo);
  }
  void _onSendLgLogo(SendLgLogo event, Emitter<SendLgLogoState> emit) async {
    emit(SendLgLogoLoading());
    final result =
        await _sendLgLogoUseCase(SendLgLogoParams(client: event.client));
    result.fold(
      (failure) => emit(
        SendLgLogoFailure(failure.message),
      ),
      (_) => emit(
        SendLgLogoSuccess(),
      ),
    );
  }
}
