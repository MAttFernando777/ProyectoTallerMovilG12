import 'package:flutter/material.dart';
import 'package:proyecto_g12/Footer.dart';
import 'MenuLateral.dart';

class Conferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CONFERENCIAS")),
      body: Column(
        children : <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Resultado del Proceso de Rectificación'
                  'de Matrícula 2023-II (2do. grupo) -'
                  'Escuela Profesional de Ingeniería de Sistemas',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey),
            ),
          )



        ],
      )
    );
  }
}


