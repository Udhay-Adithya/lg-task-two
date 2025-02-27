import 'dart:convert';
import 'dart:developer';

import 'package:dartssh2/dartssh2.dart';
import 'package:lg_task_two/features/home/data/model/kml_model.dart';
import 'package:lg_task_two/features/home/data/model/screen_overlay_model.dart';

abstract interface class HomeRemoteDatasource {
  Future<void> refreshLg(
    SSHClient client,
    int numberOfRigs,
    String password, {
    int refreshInterval = 2,
  });
  Future<void> sendKml(SSHClient client, String kmlContent, String kmlName);
  Future<void> sendLgLogo(SSHClient client);
  Future<void> cleanLgLogo(SSHClient client, int numberOfRigs);
  Future<void> cleanKml(SSHClient client);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  @override
  Future<void> cleanKml(SSHClient client) async {
    try {
      await client.run('echo "" > /tmp/query.txt');
      await client.run("echo '' > /var/www/html/kmls.txt");
    } catch (e) {
      log('Failed to clean KML: $e');
    }
  }

  @override
  Future<void> cleanLgLogo(SSHClient client, int numberOfRigs) async {
    try {
      for (var i = 2; i <= numberOfRigs; i++) {
        final blankKml = KMLModel.generateBlank('slave_$i');
        await client.run("echo '$blankKml' > /var/www/html/kml/slave_$i.kml");
      }
    } catch (e) {
      log('Failed to clean logo: $e');
    }
  }

  @override
  Future<void> refreshLg(
    SSHClient client,
    int numberOfRigs,
    String password, {
    int refreshInterval = 2,
  }) async {
    try {
      if (numberOfRigs < 1) {
        log('Invalid number of rigs: $numberOfRigs');
        return;
      }

      // Loop through all rigs
      for (var i = 1; i <= numberOfRigs; i++) {
        log('Setting refresh for rig $i...');

        // Check if myplaces.kml exists
        String checkFileCommand =
            'test -f ~/earth/kml/slave/myplaces.kml && echo "exists"';
        var result = await client
            .run('sshpass -p $password ssh lg$i \'$checkFileCommand\'');
        var resultString = utf8.decode(result);
        log("Result String: $resultString");
        if (!resultString.contains('exists')) {
          log('myplaces.kml does not exist on rig $i');
          continue;
        }

        // Define search and replace strings
        String search = '<href>##LG_PHPIFACE##kml/slave_$i.kml</href>';
        String replace = '''
      <href>##LG_PHPIFACE##kml/slave_$i.kml</href>
      <refreshMode>onInterval</refreshMode>
      <refreshInterval>$refreshInterval</refreshInterval>
      '''
            .trim();

        // Modify myplaces.kml
        String command = '''
      echo $password | sudo -S sed -i "s/$search/$replace/" ~/earth/kml/slave/myplaces.kml
      ''';
        await client.run('sshpass -p $password ssh -t lg$i \'$command\'');

        log('Refresh set for rig $i.');
      }
    } catch (e) {
      log('Failed to set slave refresh: $e');
    }
  }

  @override
  Future<void> sendKml(
    SSHClient client,
    String kmlContent,
    String kmlName,
  ) async {
    try {
      // // Fly to the kml location
      // final flyRes = await client.run(
      //     "echo 'search = \"2.2945\",\"48.85840000000001\"' > /tmp/query.txt");
      // Step 1: Create the kmls directory if it doesn't exist
      await client.run('mkdir -p /var/www/html/kmls');

      // Step 2: Upload the KML file using SFTP
      final sftp = await client.sftp();
      final sftpFile = await sftp.open(
        '/var/www/html/kmls/$kmlName.kml',
        mode: SftpFileOpenMode.create |
            SftpFileOpenMode.truncate |
            SftpFileOpenMode.write,
      );

      // Convert the KML content to a byte stream and upload it
      final kmlStream = Stream.value(utf8.encode(kmlContent.trim()));
      await sftpFile.write(kmlStream);
      await sftpFile.close();

      // Step 3: Link the KML file in kmls.txt
      final result = await client.run(
          "echo 'http://lg1:81/kmls/$kmlName.kml' > /var/www/html/kmls.txt");

      var resultString = utf8.decode(result);
      log("Res: $resultString");

      log('KML file "$kmlName.kml" uploaded, linked, and reloaded successfully.');
    } catch (e, stackTrace) {
      log('Failed to send KML: $e');
      log(stackTrace.toString());
    }
  }

  @override
  Future<void> sendLgLogo(SSHClient client) async {
    try {
      final screenOverlay = ScreenOverlayModel.logo();
      final kml = KMLModel(
        name: 'LG-Logo',
        content: '<name>Liquid Galaxy Logo</name>',
        screenOverlay: screenOverlay.tag,
      );

      await client.run("echo '${kml.body}' > /var/www/html/kml/slave_3.kml");
      log('Logo KML file updated successfully.');
    } catch (e) {
      log('Failed to set logo: $e');
    }
  }
}
