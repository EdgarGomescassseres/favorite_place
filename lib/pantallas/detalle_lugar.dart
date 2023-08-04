import 'package:favorite_places_app/models/lugar.dart';
import 'package:flutter/material.dart';

class DetalleLugar extends StatelessWidget{
 const DetalleLugar({super.key, required this.lugar});

 final Lugar lugar;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lugar.titulo),
      ),
      body: Stack(
        children: [
          Image.file(lugar.imagen,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,)
        ],
      ),
    );
  }
}