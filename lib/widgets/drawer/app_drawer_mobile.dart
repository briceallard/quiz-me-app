import 'package:flutter/material.dart';
import 'package:quiz_me_app/widgets/drawer/app_drawer.dart';

class AppDrawerMobile extends StatelessWidget {
  AppDrawerMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Container(
        width: orientation == Orientation.portrait ? 250 : 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 16,
              color: Colors.black12,
            )
          ],
        ),
        child: Column(
          children: AppDrawer.getDrawerOptions(),
        ),
      ),
    );
  }
}
