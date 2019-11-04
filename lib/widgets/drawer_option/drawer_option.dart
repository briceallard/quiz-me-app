import 'package:flutter/widgets.dart';
import 'package:quiz_me_app/app/models/responsive/orientation_layout.dart';
import 'package:quiz_me_app/app/models/responsive/screen_type_layout.dart';
import 'package:quiz_me_app/widgets/drawer_option/drawer_option_mobile.dart';
import 'package:quiz_me_app/widgets/drawer_option/drawer_option_tablet.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData iconData;

  DrawerOption({
    Key key,
    this.title,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: DrawerOptionMobilePortrait(
          title: title,
          iconData: iconData,
        ),
        landscape: DrawerOptionMobileLandscape(
          iconData: iconData,
        ),
      ),
      tablet: OrientationLayout(
        portrait: DrawerOptionTabletPortrait(
          title: title,
          iconData: iconData,
        ),
        landscape: DrawerOptionTabletLandscape(
          title: title,
          iconData: iconData,
        ),
      ),
    );
  }
}
