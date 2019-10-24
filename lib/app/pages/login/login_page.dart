import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            width: deviceWidth,
            height: deviceHeight * .40,
            color: Colors.red,
            child: Center(
              child: Text('Logo Here'),
            ),
          ),
          Container(
            width: deviceWidth,
            height: deviceHeight * .55,
            color: Colors.green,
            child: Center(
              child: Text('Login Stuff'),
            ),
          )
        ],
      ),
    );
  }
}
