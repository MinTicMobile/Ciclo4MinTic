import 'package:flutter/material.dart';
import 'package:proyectoflutterapp/pages/pages.dart';
import 'package:provider/provider.dart';
import 'package:proyectoflutterapp/pages/poi_map.dart';
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
        ChangeNotifierProvider(create: ( _ ) => PoiService() )
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
        title: 'ColombiaTravel',
        initialRoute: 'checking',
        //initialRoute: 'mapa_demo',
        routes: {
          "login": (_) => LoginScreen(),
          "register": (_) => Register(),
          "detalle": (_) => DetallePages(),
          "home": (_) => HomePages(),
          "checking" : (_) =>  CheckAuth(),
          'mapa': (_) =>  PoiLocation(poi: Provider.of<PoiService>(context).selectPoi)
        },
          scaffoldMessengerKey: NoticationsService.messengerKey,
        
        );
  }
}
