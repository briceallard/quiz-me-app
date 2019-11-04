import 'package:flutter/material.dart';
import 'package:quiz_me_app/widgets/drawer/app_drawer.dart';

class HomeMobileLandscape extends StatelessWidget {
  HomeMobileLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          AppDrawer(),
        ],
      ),
    );
  }
}
