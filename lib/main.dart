import 'package:flutter/material.dart';
import 'package:proyectoflutterapp/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: 'login',
        routes: {
          "login": (_) => LoginScreen(),
          "register": (_) => Register(),
        });
  }
}
