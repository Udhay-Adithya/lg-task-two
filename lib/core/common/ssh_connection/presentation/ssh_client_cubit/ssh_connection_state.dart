part of 'ssh_clent_cubit.dart';

@immutable
sealed class SSHClientState {}

final class SSHClientInitial extends SSHClientState {}

final class SSHClientCached extends SSHClientState {}

final class SSHClientLoading extends SSHClientState {}

final class SSHClientSuccess extends SSHClientState {
  final SSHClient sshClient;

  SSHClientSuccess(this.sshClient);
}

final class SSHClientFailure extends SSHClientState {
  final String message;

  SSHClientFailure(this.message);
}
