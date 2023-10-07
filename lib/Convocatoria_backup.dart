import 'package:flutter/material.dart';
import 'package:proyecto_g12/Footer.dart';
import 'MenuLateral.dart';
import 'Elemento.dart';

class Noticia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: MenuLateral(),
        appBar: AppBar(title: Text("NOTICIAS")),
        body: SingleChildScrollView(
          child: Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.red,
                    child: Center(child: Text('Noticias')),
                  ),
                  const ListTile(
                    leading: Icon(Icons.festival),
                    title: Text("PRIMERA NOTICIA"),
                    subtitle: Text("SUBTITULO PRIMERA NOTICIA"),
                  ),
                  Divider(),
                  const ListTile(
                    leading: Icon(Icons.festival),
                    title: Text("SEGUNDA NOTICIA"),
                    subtitle: Text("SUBTITULO SEGUNDA NOTICIA"),
                  ),
                  Divider(),
                  const ListTile(
                    leading: Icon(Icons.festival),
                    title: Text("TERCERA NOTICIA"),
                    subtitle: Text("SUBTITULO TERCERA NOTICIA"),
                  ),
                  Divider(),
                  const ListTile(
                    leading: Icon(Icons.festival),
                    title: Text("CUARTA NOTICIA"),
                    subtitle: Text("CUARTA TERCERA NOTICIA"),
                  ),
                  Divider(),
                  const ListTile(
                    leading: Icon(Icons.festival),
                    title: Text("QUINTA NOTICIA"),
                    subtitle: Text("SUBTITULO QUINTA NOTICIA"),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}

void main() => runApp(Noticia());
