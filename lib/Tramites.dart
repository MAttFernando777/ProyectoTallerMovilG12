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
                  child: const Text("LEER MAS..."),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SecTram()));
                  },
                ),
              ]),
              Divider(),

              const ListTile(
                leading: Icon(Icons.document_scanner),
                title: Text("SEGUNDA NOTICIA"),
                subtitle: Text("SUBTITULO SEGUNDA NOTICIA"),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                TextButton(
                  child: const Text("LEER MAS..."),
                  onPressed: () {},
                ),
              ]),
              Divider(),
              const ListTile(
                leading: Icon(Icons.document_scanner),
                title: Text("TERCERA NOTICIA"),
                subtitle: Text("SUBTITULO TERCERA NOTICIA"),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                TextButton(
                  child: const Text("LEER MAS..."),
                  onPressed: () {},
                ),
              ]),
              Divider(),
              const ListTile(
                leading: Icon(Icons.document_scanner),
                title: Text("CUARTA NOTICIA"),
                subtitle: Text("CUARTA TERCERA NOTICIA"),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                TextButton(
                  child: const Text("LEER MAS..."),
                  onPressed: () {},
                ),
              ]),
              Divider(),
              const ListTile(
                leading: Icon(Icons.document_scanner),
                title: Text("QUINTA NOTICIA"),
                subtitle: Text("SUBTITULO QUINTA NOTICIA"),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                TextButton(
                  child: const Text("bbobob MAS..."),
                  onPressed: () {},
                ),
              ]),
            ])),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
