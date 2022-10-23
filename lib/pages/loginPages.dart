import 'package:flutter/material.dart';
import 'package:proyectoflutterapp/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 200),
          CardContainer(
              child: Column(
            children: [
              SizedBox(height: 10),
              Text("Login", style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 30),
              _loginForm()
            ],
          )),
          SizedBox(height: 50),
          Text("Crear una nueva cuenta Video #209",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
        ],
      ),
    )));
  }
}

class _loginForm extends StatelessWidget {
  const _loginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
                hintText: "jhon.doe@gmail.com",
                labelText: "Correo",labelStyle: TextStyle(color: Colors.grey
                ),
                prefixIcon: Icon(Icons.alternate_email_sharp, color: Colors.deepPurple)
                ),
                
          )
        ],
      )),
    );
  }
}
