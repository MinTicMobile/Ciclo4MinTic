import 'package:flutter/material.dart';
import 'package:proyectoflutterapp/pages/pages.dart';
import 'package:provider/provider.dart';
import 'package:proyectoflutterapp/services/service.dart';
void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() ),
      ],
      child: MyApp(),
    );
  }
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
