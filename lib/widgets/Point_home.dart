import 'package:flutter/material.dart';
import 'package:proyectoflutterapp/models/models.dart';

class PointHome extends StatelessWidget {
  final Poi poi;

  const PointHome({Key? key, required this.poi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            width: double.infinity,
            height: 250,
            decoration: BoxCardDecoration(),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                _BackgroundImage(url : poi.img),
                _PointDetalle(
                  ciudad: poi.ciudad,
                  departamento: poi.departamento,
                  puntointeres: poi.poi,
                  id: poi.id!,
                ),
              ],
            )));
  }

  BoxDecoration BoxCardDecoration() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]);
}

class _PointDetalle extends StatelessWidget {
  final String ciudad;
  final String departamento;
  final String puntointeres;
  final String id;

  const _PointDetalle(
      {required this.ciudad,
      required this.departamento,
      required this.puntointeres,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 60,
        decoration: _buildDecoration(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '$puntointeres - $ciudad $departamento',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ]));
  }

  BoxDecoration _buildDecoration() => BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)));
}

class _BackgroundImage extends StatelessWidget {
  final String? url;

  const _BackgroundImage({this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: double.infinity,
          height: 250,
          child: url == null 
          ? Image(
            image : AssetImage('assets/no-image.png'),
            fit : BoxFit.cover,
          ) 
          : FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage(url!),
                  fit : BoxFit.cover,
              ),
        ));
  }
}
