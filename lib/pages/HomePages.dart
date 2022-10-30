import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoflutterapp/services/service.dart';

class HomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(48, 10, 104, 1),
          title: Text("Detalles"),
          actions: [
            IconButton(
                icon: Icon(Icons.login_outlined),
                onPressed: () {
                  authService.logout();
                  Navigator.pushReplacementNamed(context, 'login');
                })
          ],
        ),
        body: Stack(
          children: [
            Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
              height: 400,
              child: Image.asset('assets/Detalle.jpg', fit: BoxFit.cover),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 300),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Cartagena D.C",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold))),
                  Row(
                    children: [
                      SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "37 ° C",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite),
                        color: Colors.red,
                      )
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.all(32),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(children: [
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.purple,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.purple,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.purple,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.purple,
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          color: Colors.purple,
                                        ),
                                      ],
                                    ),
                                    Text.rich(
                                        TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(Icons.location_on,
                                                  size: 16,
                                                  color: Colors.grey)),
                                          TextSpan(text: "8 km cerca de ti")
                                        ]),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12))
                                  ]),
                            ),
                          ]),
                          SizedBox(height: 30),
                          Text("Descripcion".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14)),
                          SizedBox(height: 10),
                          Text(
                            "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14.0),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14.0),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
