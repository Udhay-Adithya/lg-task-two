part of 'clean_kml_bloc.dart';

@immutable
sealed class CleanKmlEvent {}

final class CleanKml extends CleanKmlEvent {
  final SSHClient client;

  CleanKml({
    required this.client,
  });
}
