part of 'send_lg_logo_bloc.dart';

@immutable
sealed class SendLgLogoState {}

final class SendLgLogoInitial extends SendLgLogoState {}

final class SendLgLogoLoading extends SendLgLogoState {}

final class SendLgLogoSuccess extends SendLgLogoState {}

final class SendLgLogoFailure extends SendLgLogoState {
  final String message;

  SendLgLogoFailure(this.message);
}