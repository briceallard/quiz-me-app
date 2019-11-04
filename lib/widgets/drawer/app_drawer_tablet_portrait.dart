import 'package:flutter/material.dart';
import 'package:quiz_me_app/widgets/drawer/app_drawer.dart';

class AppDrawerTabletPortrait extends StatelessWidget {
  AppDrawerTabletPortrait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: Colors.black12,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: AppDrawer.getDrawerOptions(),
      ),
    );
  }
}
