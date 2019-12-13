import 'package:flutter/material.dart';
import 'screens/dashboard/index.dart';
import 'screens/list/index.dart';
import 'screens/long-list/index.dart';
import 'screens/history/index.dart';
import 'screens/login/index.dart';
import 'screens/splash/index.dart';
import 'widgets/home.dart';
import 'widgets/onboarding.dart';
import 'widgets/transaction.dart';
// import 'widgets/profile.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/dashboard': (BuildContext context) => new Dashboard(),
    '/home': (BuildContext context) => new Home(),
    '/onboarding': (BuildContext context) => new Onboarding(),
    '/list': (BuildContext context) => new MyListRoute(),
    '/history': (BuildContext context) => new History(),
    '/login': (BuildContext context) => new Login(),
    '/long-list': (BuildContext context) => new LongListRoute(),
    '/transaction': (BuildContext context) => new Transaction(),
    // '/profile': (BuildContext context) => new Profile(),
  };

  Routes () {
    runApp(new MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      // home: new Dashboard(),
      home: new SplashScreen(),
    ));
  }
}
