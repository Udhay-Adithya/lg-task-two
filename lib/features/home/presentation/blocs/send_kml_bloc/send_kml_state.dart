part of 'send_kml_bloc.dart';

@immutable
sealed class SendKmlState {}

final class SendKmlInitial extends SendKmlState {}

final class SendKmlLoading extends SendKmlState {}

final class SendKmlSuccess extends SendKmlState {}

final class SendKmlFailure extends SendKmlState {
  final String message;

  SendKmlFailure(this.message);
}