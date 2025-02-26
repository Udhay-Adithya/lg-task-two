part of 'clean_lg_logo_bloc.dart';

@immutable
sealed class CleanLgLogoEvent {}

final class CleanLgLogo extends CleanLgLogoEvent {
  final SSHClient client;
  final int numberOfRigs;

  CleanLgLogo({
    required this.client,
    required this.numberOfRigs,
  });
}
