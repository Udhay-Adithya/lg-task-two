class KmlConstants {
  final eiffelTower = """<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
<Document>
	<name>Eiffel Tower</name>
	<Placemark id="0709CC4829367DA7C09B">
		<name>Eiffel Tower</name>
		<Point>
			<coordinates>2.2945,48.85840000000001,100</coordinates>
		</Point>
	</Placemark>
</Document>
</kml>""";

  final sanFrancisco = r"""<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2"
     xmlns:gx="http://www.google.com/kml/ext/2.2"
     xmlns:kml="http://www.opengis.net/kml/2.2"
     xmlns:atom="http://www.w3.org/2005/Atom">
  <Document>
    <name>San Francisco Highlight</name>
    <description><![CDATA[
      <h2>San Francisco, California</h2>
      <p><b>San Francisco</b>, officially the City and County of San Francisco, is a 
      commercial, financial, and cultural center within Northern California.</p>
      <p>Known for the <b>Golden Gate Bridge</b>, <b>Alcatraz Island</b>, 
      <b>Fisherman's Wharf</b>, and its iconic cable cars, the city attracts millions of tourists every year.</p>
      <p><i>Coordinates:</i> -122.4376000, 37.7577000</p>
      <p><a href="https://en.wikipedia.org/wiki/San_Francisco" target="_blank">More info on Wikipedia</a></p>
    ]]></description>

    <!-- Define a style for the Placemark -->
    <Style id="sfStyle">
      <IconStyle>
        <scale>1.2</scale>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/shapes/star.png</href>
        </Icon>
      </IconStyle>
      <LabelStyle>
        <color>ff0000ff</color> <!-- Blue label -->
        <scale>1.2</scale>
      </LabelStyle>
      <BalloonStyle>
        <text><![CDATA[
          <h2>$[name]</h2>
          <p><b>Description:</b> $[description]</p>
        ]]></text>
      </BalloonStyle>
    </Style>

    <!-- Viewpoint for better visualization -->
    <LookAt>
      <longitude>-122.4376000</longitude>
      <latitude>37.7577000</latitude>
      <altitude>5000</altitude>
      <heading>0</heading>
      <tilt>45</tilt>
      <range>10000</range>
      <altitudeMode>relativeToGround</altitudeMode>
    </LookAt>

    <Placemark>
      <name>San Francisco</name>
      <description><![CDATA[
        <h2>Welcome to San Francisco!</h2>
        <p>San Francisco, officially the City and County of San Francisco, is a 
        commercial, financial, and cultural center within Northern California.</p>
        <p>Famous landmarks:</p>
        <ul>
          <li>Golden Gate Bridge</li>
          <li>Alcatraz Island</li>
          <li>Fisherman's Wharf</li>
          <li>Coit Tower</li>
        </ul>
        <p><a href="https://www.sanfrancisco.travel/" target="_blank">Visit SF Official Tourism Site</a></p>
      ]]></description>
      <gx:balloonVisibility>1</gx:balloonVisibility>
      <styleUrl>#sfStyle</styleUrl>
      <Point>
        <coordinates>-122.4376000,37.7577000,0</coordinates>
      </Point>
    </Placemark>
  </Document>
</kml>""";
}
