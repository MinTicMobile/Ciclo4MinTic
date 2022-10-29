import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoflutterapp/widgets/widgets.dart';
import 'package:proyectoflutterapp/ui/input_decorations.dart';
import 'package:proyectoflutterapp/providers/login_form_providers.dart';
import 'package:proyectoflutterapp/services/service.dart';

class Register extends StatelessWidget {
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
              Text("Registrar", style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 30),
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(), child: _loginForm()),
            ],
          )),
          SizedBox(height: 30),
          TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
              child: Text("¿Ya tienes cuenta?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
        ],
      ),
    )));
  }
}

class _loginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
             
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'jhon.doe@gmail.com',
                    labelText: 'Correo electronico',
                    prefixIcon: Icons.alternate_email_sharp),
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Correo no valido';
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '********',
                    labelText: 'Contraseña',
                    prefixIcon: Icons.lock_outlined),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  if (value != null && value.length >= 6) return null;
                  return 'La contraseña debe ser de 6 caracteres';
                },
              ),
              SizedBox(height: 30),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Color.fromRGBO(48, 10, 104, 1),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(loginForm.isLoading ? "Loading" : 'Registrate',
                          style: TextStyle(color: Colors.white))),
                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          final authService =
                              Provider.of<AuthService>(context, listen: false);
                          loginForm.isValidForm();
                          loginForm.isLoading = true;
                          final String? errorMessage =
                              await authService.createUser(loginForm.email, loginForm.password);
                          if (errorMessage == null) {
                             Navigator.pushReplacementNamed(context, 'home');
                          }else{
                            print(errorMessage);
                            loginForm.isLoading = false;
                          }
                          
                        })
            ],
          )),
    );
  }
}
