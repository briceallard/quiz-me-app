import 'package:flutter/material.dart';
import 'package:quiz_me_app/app/models/responsive/orientation_layout.dart';
import 'package:quiz_me_app/app/models/responsive/screen_type_layout.dart';
import 'package:quiz_me_app/app/pages/home/home_mobile_landscape.dart';
import 'package:quiz_me_app/app/pages/home/home_mobile_portrait.dart';
import 'package:quiz_me_app/app/pages/home/home_tablet.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: HomeMobilePortrait(),
        landscape: HomeMobileLandscape(),
      ),
      tablet: HomeTablet(),
    );
  }
}
