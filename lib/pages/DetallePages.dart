import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoflutterapp/services/service.dart';

class DetallePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final poiService = Provider.of<PoiService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(48, 10, 104, 1),
        title: const Text("Detalles"),
        actions: [
          IconButton(
              icon: const Icon(Icons.login_outlined),
              onPressed: () {
                authService.logout();
                Navigator.pushReplacementNamed(context, 'login');
              })
        ],
      ),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(color: Colors.black26),
            height: 400,
            child: poiService.selectPoi.img == null
                ? const Image(
                    image: AssetImage('assets/no-image.png'),
                    fit: BoxFit.cover,
                  )
                : FadeInImage(
                    placeholder: const AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage(poiService.selectPoi.img),
                    fit: BoxFit.cover,
                  ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 250),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                        poiService.selectPoi.poi +
                            " " +
                            poiService.selectPoi.ciudad +
                            " " +
                            poiService.selectPoi.departamento,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold))),
                Row(
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        (poiService.selectPoi.temperatura).toString() + "°C",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
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
                                  children: const [
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
                                const Text.rich(
                                    TextSpan(children: [
                                      WidgetSpan(
                                          child: Icon(Icons.location_on,
                                              size: 16, color: Colors.grey)),
                                      TextSpan(text: "8 km cerca de ti")
                                    ]),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12))
                              ]),
                        ),
                      ]),
                      const SizedBox(height: 30),
                      Text("Descripción".toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14)),
                      const SizedBox(height: 10),
                      Text(
                        poiService.selectPoi.descripcion,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                     // Text(
                     //     'latitud ${poiService.selectPoi.lat} , longitud ${poiService.selectPoi.log}'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromRGBO(48, 10, 104, 1),
        onPressed: () {
          Navigator.pushNamed(context, 'mapa');
        },
        label: const Text('Ir al mapa'),
        icon: const Icon(Icons.location_on),
      ),
    );
  }
}
