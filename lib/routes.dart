import 'package:flutter/material.dart';
import 'screens/home/index.dart';
import 'screens/auth/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => new Home(),
    '/Auth': (BuildContext context) => new Auth()
  };

  Routes () {
    runApp(new MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      home: new Home(),
    ));
  }
}