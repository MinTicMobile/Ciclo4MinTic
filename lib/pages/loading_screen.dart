import 'package:flutter/material.dart';
import 'package:proyectoflutterapp/services/service.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final authService = Provider.of<AuthService>(context, listen: false);
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
      body : Center(
        child : CircularProgressIndicator(
          color: Colors.indigo,
        )
      )
    );
  }
}