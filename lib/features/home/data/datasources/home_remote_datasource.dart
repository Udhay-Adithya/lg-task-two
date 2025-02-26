import 'dart:convert';
import 'dart:developer';

import 'package:dartssh2/dartssh2.dart';

abstract interface class HomeRemoteDatasource {
  Future<void> refreshLg(
    SSHClient client,
    int numberOfRigs,
    String password, {
    int refreshInterval = 2,
  });
  Future<void> sendKml(SSHClient client, String kmlContent);
  Future<void> sendLgLogo(SSHClient client);
  Future<void> cleanLgLogo(SSHClient client, int numberOfRigs);
  Future<void> cleanKml(SSHClient client);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  @override
  Future<void> cleanKml(SSHClient client) async {}

  @override
  Future<void> cleanLgLogo(
    SSHClient client,
    int numberOfRigs,
  ) async {
    try {
      for (var i = 2; i <= numberOfRigs; i++) {
        await client.run("echo '' > /var/www/html/kml/slave_$i.kml");
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
  Future<void> sendKml(SSHClient client, String kmlContent) async {}

  @override
  Future<void> sendLgLogo(SSHClient client) async {
    try {
      const String logoContent = '''<?xml version="1.0" encoding="UTF-8"?>
        <kml xmlns="http://www.opengis.net/kml/2.2">
         <ScreenOverlay>
           <name>Logo</name>
           <Icon>
             <href>https://1.bp.blogspot.com/-POkV83Ut-7k/XdjpKI4M8AI/AAAAAAAHdXA/VSFXPJQsIOkdqtkJrGnh59WxaRqaQEtmQCLcBGAsYHQ/s1600/LOGO%2BLIQUID%2BGALAXY-sq1000-%2BOKnoline.png</href>
            </Icon>
            <overlayXY x="0" y="1" xunits="fraction" yunits="fraction"/>
            <screenXY x="0.05" y="0.95" xunits="fraction" yunits="fraction"/>
            <size x="0.2" y="0.2" xunits="fraction" yunits="fraction"/>
          </ScreenOverlay>
        </kml>''';

      final res = await client
          .run("echo '$logoContent' > /var/www/html/kml/slave_1.kml");
      log('Logo sent: ${utf8.decode(res)}');

      // Verify the file was created
      var verifyFile = await client.run('cat /var/www/html/kml/slave_1.kml');
      log('KML File Content: ${utf8.decode(verifyFile)}');
    } catch (e) {
      log('Failed to set logo: $e');
    }
  }
}
