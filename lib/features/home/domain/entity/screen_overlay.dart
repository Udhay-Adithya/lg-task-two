class ScreenOverlay {
  final String name;
  final String link;
  final String overlayXY;
  final String screenXY;
  final String size;

  ScreenOverlay({
    required this.name,
    required this.link,
    this.overlayXY = 'x="0" y="1" xunits="fraction" yunits="fraction"',
    this.screenXY = 'x="0.05" y="0.95" xunits="fraction" yunits="fraction"',
    this.size = 'x="0.2" y="0.2" xunits="fraction" yunits="fraction"',
  });
}
