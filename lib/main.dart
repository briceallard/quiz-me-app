import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz_me_app/app/models/user_model.dart';
import 'package:quiz_me_app/app/pages/login/login_page.dart';
import 'package:quiz_me_app/app/repositories/auth_repository.dart';
import 'package:quiz_me_app/app/repositories/bottom_navigation_provider.dart';
import 'package:quiz_me_app/app/repositories/db_repository.dart';
import 'package:quiz_me_app/app/utils/router/router.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black.withOpacity(0.0), //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      systemNavigationBarColor: Colors.black.withOpacity(0.0), //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthRepository>.value(
          value: AuthRepository.instance()),
          ChangeNotifierProvider<DatabaseService>.value(
            value: DatabaseService.instance()),
            ChangeNotifierProvider(builder: (_) => BottomNavigationProvider())
      ],
      child: Consumer(
        builder: (BuildContext context, AuthRepository auth, _) {
          return StreamProvider<User>.value(
            initialData: User.initial(),
            value: DatabaseService.instance().getUser(auth.firebaseUser),
            child: QuizMeApp(),
          );
        },
      ),
    )
  ));
}

class QuizMeApp extends StatelessWidget {
  final Router _router;

  QuizMeApp() : _router = Router();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: 'Quiz Me',
      home: LoginPage(),
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver],
    );
  }

  // class Authorize extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return Consumer(
  //     builder: (context, AuthRepository auth, _) {
  //       switch (auth.status) {
  //         case Status.Uninitialized:
  //           return SplashPage();
  //         case Status.Unauthenticated:
  //         case Status.Authenticating:
  //         case Status.Authenticated:
  //           return IndexPage();
  //       }
  //     },
  //   );
  // }
}
