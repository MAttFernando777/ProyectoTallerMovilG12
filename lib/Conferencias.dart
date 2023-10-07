import 'package:flutter/material.dart';
import 'package:proyecto_g12/Footer.dart';
import 'MenuLateral.dart';
import 'Elemento.dart';

class Conferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("CONFERENCIAS")),
        body: Center(
            child: SingleChildScrollView(
          child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
              width: 150,
              height: 120,
              padding: const EdgeInsets.all(10.0),
              color: Colors.red,
              child: Center(child: Text('Conferencias')),
            ),
            const ListTile(
              leading: Icon(Icons.festival),
              title: Text("PRIMERA CONFERENCIA"),
              subtitle: Text("CONFERENCIA PRIMERA NOTICIA"),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              TextButton(
                child: const Text("LEER MAS..."),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Elemento()));
                },
              ),
            ]),
            Divider(),
            //DE AQUI A MAS ABAJO SE REPITE LO DE ARRIBA.
            const ListTile(
              leading: Icon(Icons.festival),
              title: Text("SEGUNDA CONFERENCIA"),
              subtitle: Text("SUBTITULO SEGUNDA CONFERENCIA"),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              TextButton(
                child: const Text("LEER MAS..."),
                onPressed: () {},
              ),
            ]),
            Divider(),
            const ListTile(
              leading: Icon(Icons.festival),
              title: Text("TERCERA NOTICIA"),
              subtitle: Text("SUBTITULO TERCERA CONFERENCIA"),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              TextButton(
                child: const Text("LEER MAS..."),
                onPressed: () {},
              ),
            ]),
            Divider(),
            const ListTile(
              leading: Icon(Icons.festival),
              title: Text("CUARTA CONFERENCIA"),
              subtitle: Text("CUARTA TERCERA CONFERENCIA"),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              TextButton(
                child: const Text("LEER MAS..."),
                onPressed: () {},
              ),
            ]),
            Divider(),
            const ListTile(
              leading: Icon(Icons.festival),
              title: Text("QUINTA CONFERENCIA"),
              subtitle: Text("SUBTITULO QUINTA CONFERENCIA"),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              TextButton(
                child: const Text("LEER MAS..."),
                onPressed: () {},
              ),
            ]),
            Divider(),
            const ListTile(
              leading: Icon(Icons.festival),
              title: Text("QUINTA CONFERENCIA"),
              subtitle: Text("SUBTITULO QUINTA CONFERENCIA"),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              TextButton(
                child: const Text("LEER MAS..."),
                onPressed: () {},
              ),
            ]),
          ])),
        )));
  }
}
