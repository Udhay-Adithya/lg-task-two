part of 'refresh_lg_bloc.dart';

@immutable
sealed class RefreshLgEvent {}

final class RefreshLg extends RefreshLgEvent{
  final SSHClient client;
  final int numberOfRigs;
  final String password;
  final int refreshInterval;

  RefreshLg({
    required this.client,
    required this.numberOfRigs,
    required this.password,
    this.refreshInterval = 2,
  });
}
