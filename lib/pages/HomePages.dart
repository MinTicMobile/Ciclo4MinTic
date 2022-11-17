import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoflutterapp/services/service.dart';
import 'package:proyectoflutterapp/widgets/widgets.dart';
import 'package:proyectoflutterapp/pages/pages.dart';

class HomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final poiService = Provider.of<PoiService>(context);

    if (poiService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(48, 10, 104, 1),
        title: Text("Puntos de interes"),
        actions: [
          IconButton(
              icon: Icon(Icons.login_outlined),
              onPressed: () {
                authService.logout();
                Navigator.pushReplacementNamed(context, 'login');
              })
        ],
      ),
      body: ListView.builder(
        itemCount: poiService.poi.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {
              poiService.selectPoi = poiService.poi[index].copy();
              Navigator.pushNamed(context, 'detalle');
            },
            child: PointHome(
              poi: poiService.poi[index],
            )),
      ),
    );
  }
}
