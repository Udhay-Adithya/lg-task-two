part of 'refresh_lg_bloc.dart';

@immutable
sealed class RefreshLgState {}

final class RefreshLgInitial extends RefreshLgState {}

final class RefreshLgLoading extends RefreshLgState {}

final class RefreshLgSuccess extends RefreshLgState {}

final class RefreshLgFailure extends RefreshLgState {
  final String message;

  RefreshLgFailure(this.message);
}