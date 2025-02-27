part of 'send_kml_bloc.dart';

@immutable
sealed class SendKmlEvent {}

final class SendKml extends SendKmlEvent {
  final SSHClient client;
  final String kmlContent;
  final String kmlName;

  SendKml({
    required this.client,
    required this.kmlContent,
    required this.kmlName,
  });
}
