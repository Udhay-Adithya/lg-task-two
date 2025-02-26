part of 'send_lg_logo_bloc.dart';

@immutable
sealed class SendLgLogoEvent {}

final class SendLgLogo extends SendLgLogoEvent {
  final SSHClient client;

  SendLgLogo({
    required this.client,
  });
}
