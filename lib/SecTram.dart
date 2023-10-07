import 'package:flutter/material.dart';
import 'MenuLateral.dart';

class SecTram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    title: const Text('Anulación de Matrícula Semestre Académico 2023–II'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Se informa a los alumnos regulares de la Facultad de Ingeniería de Sistemas e Informática, que según cronograma de actividades académicas del 2023, se dará inicio al Proceso de Anulación de Matrícula.'),
            Text(''),
            Text('REQUISITOS:'),
            Text('1. Presentar solicitud (descargar formato) a través del Módulo de Atención de Trámites (MAT)'),
            Text('2. Adjuntar reporte de matrícula del semestre 2023-II.'),
            Text('3. Adjuntar copia del DNI (ambas caras legibles).')
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Aceptar'),
          onPressed: (){
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
