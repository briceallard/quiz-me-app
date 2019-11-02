import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Container(
          child: Text('Home page'),
        ),
      ),
    );
  }
}

/*

Track work progress, approximate completion time and arrival time
automatic notification for tracking progress (on the way, complete)
Quote customers prices based on submitted pictures
Check schedule for work order progression

** Services offered by business **
Landscaping
Sprinklers
Spraying chemicals
Mowing
Bids
Snow removal

** Expected costs **

www.absolutelawncareonline.com
5,000+
recurring monthly maintenance fee's ??? Probable

*/