import 'package:flutter/material.dart';
import 'package:quiz_me_app/app/models/responsive/orientation_layout.dart';
import 'package:quiz_me_app/app/models/responsive/screen_type_layout.dart';
import 'package:quiz_me_app/widgets/drawer/app_drawer_mobile.dart';
import 'package:quiz_me_app/widgets/drawer/app_drawer_tablet_landscape.dart';
import 'package:quiz_me_app/widgets/drawer/app_drawer_tablet_portrait.dart';
import 'package:quiz_me_app/widgets/drawer_option/drawer_option.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return ScreenTypeLayout(
      mobile: AppDrawerMobile(),
      tablet: OrientationLayout(
        portrait: AppDrawerTabletPortrait(),
        landscape: AppDrawerTabletLandscape(),
      ),
    );
  }

  static List<Widget> getDrawerOptions() {
    return [
      DrawerOption(
        title: 'Scores',
        iconData: Icons.score,
      ),
      DrawerOption(
        title: 'Assignments',
        iconData: Icons.assignment,
      ),
      DrawerOption(
        title: 'Announcements',
        iconData: Icons.announcement,
      ),
      DrawerOption(
        title: 'Messages',
        iconData: Icons.message,
      ),
      DrawerOption(
        title: 'Settings',
        iconData: Icons.settings,
      ),
    ];
  }
}
