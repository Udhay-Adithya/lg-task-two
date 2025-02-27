import 'package:lg_task_two/features/home/domain/entity/screen_overlay.dart';

class ScreenOverlayModel extends ScreenOverlay {
  ScreenOverlayModel({
    required super.name,
    required super.link,
  });

  String get tag => '''
<ScreenOverlay>
  <name>$name</name>
  <Icon>
    <href>$link</href>
  </Icon>
  <overlayXY $overlayXY/>
  <screenXY $screenXY/>
  <size $size/>
</ScreenOverlay>
  ''';

  static ScreenOverlayModel logo() {
    return ScreenOverlayModel(
      name: 'Logo',
      link:
          'https://1.bp.blogspot.com/-POkV83Ut-7k/XdjpKI4M8AI/AAAAAAAHdXA/VSFXPJQsIOkdqtkJrGnh59WxaRqaQEtmQCLcBGAsYHQ/s1600/LOGO%2BLIQUID%2BGALAXY-sq1000-%2BOKnoline.png',
    );
  }
}
