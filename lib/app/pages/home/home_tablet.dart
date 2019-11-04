import 'package:flutter/material.dart';
import 'package:quiz_me_app/widgets/drawer/app_drawer.dart';

class HomeTablet extends StatelessWidget {
  HomeTablet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var children = [
      Expanded(
        child: Container(),
      ),
      AppDrawer()
    ];

    return Scaffold(
      body: orientation == Orientation.portrait
          ? Column(
              children: children,
            )
          : Row(
              children: children.reversed.toList(),
            ),
    );
  }
}
