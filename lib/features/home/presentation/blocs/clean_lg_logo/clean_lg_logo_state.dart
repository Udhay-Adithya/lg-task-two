part of 'clean_lg_logo_bloc.dart';

@immutable
sealed class CleanLgLogoState {}

final class CleanLgLogoInitial extends CleanLgLogoState {}

final class CleanLgLogoLoading extends CleanLgLogoState {}

final class CleanLgLogoSuccess extends CleanLgLogoState {}

final class CleanLgLogoFailure extends CleanLgLogoState {
  final String message;

  CleanLgLogoFailure(this.message);
}
