import 'package:flutter/material.dart';
import 'package:proyecto_g12/Footer.dart';
import 'MenuLateral.dart';
import 'SecTram.dart';

class Tramites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(title: Text("TRAMITES")),
      body: Center(
          child: SingleChildScrollView(
        child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(10.0),
            color: Colors.red,
            child: Center(child: Text('Tramites')),
          ),
          const ListTile(
            leading: Icon(Icons.document_scanner),
            title: Text("ANULACIÓN DE MATRICULA:"),
            subtitle: Text("Anulación de Matrícula Semestre Académico 2023–II"),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            TextButton(
              child: const Text("Seguir leyendo"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SecTram()));
              },
            ),
          ]),
          Divider(),
          const ListTile(
            leading: Icon(Icons.document_scanner),
            title: Text("CARNÉ UNHIVERSITARIO"),
            subtitle: Text("Trámite de Carné Universitario 2023 - Rezagados"),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            TextButton(
              child: const Text("Seguir leyendo"),
              onPressed: () {},
            ),
          ]),
          Divider(),
          const ListTile(
            leading: Icon(Icons.document_scanner),
            title: Text("TRAMITE DE BACHILLER"),
            subtitle: Text(
                "Requisitos para tramitar el Grado Académico de Bachiller"),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            TextButton(
              child: const Text("Seguir leyendo"),
              onPressed: () {},
            ),
          ]),
          Divider(),
          const ListTile(
            leading: Icon(Icons.document_scanner),
            title: Text("TRAMITE DE TITULO  PROFESIONAL"),
            subtitle: Text("Requisitos para tramitar el Título Profesional"),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            TextButton(
              child: const Text("Seguir leyendo"),
              onPressed: () {},
            ),
          ]),
          Divider(),
          const ListTile(
            leading: Icon(Icons.document_scanner),
            title: Text("RECTIFICACION DE MATRICULA"),
            subtitle: Text("Requisitos para la salida o ingreso de cursos"),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            TextButton(
              child: const Text("Seguir leyendo"),
              onPressed: () {},
            ),
          ]),
        ])),
      )),
      bottomNavigationBar: Footer(),
    );
  }
}