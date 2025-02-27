import 'package:lg_task_two/features/home/domain/entity/kml.dart';

class KMLModel extends KML {
  KMLModel({
    required super.name,
    required super.content,
    required super.screenOverlay,
  });

  String get body => '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>$name</name>
    <open>1</open>
    <Folder>
      $content
      $screenOverlay
    </Folder>
  </Document>
</kml>
  ''';

  static String generateBlank(String id) {
    return '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document id="$id">
  </Document>
</kml>
    ''';
  }
}
