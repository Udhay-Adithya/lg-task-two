part of 'clean_kml_bloc.dart';

@immutable
sealed class CleanKmlState {}

final class CleanKmlInitial extends CleanKmlState {}

final class CleanKmlLoading extends CleanKmlState {}

final class CleanKmlSuccess extends CleanKmlState {}

final class CleanKmlFailure extends CleanKmlState {
  final String message;

  CleanKmlFailure(this.message);
}
