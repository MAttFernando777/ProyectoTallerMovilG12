import 'package:flutter/material.dart';
import 'package:proyecto_g12/Footer.dart';
import 'MenuLateral.dart';

class Noticia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(),
      body: Center(
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text("LEER MAS..."),
                    onPressed: (){},
                  ),

                ]
              ),
              Divider(),
              //DE AQUI A MAS ABAJO SE REPITE LO DE ARRIBA.
              const ListTile(
                leading: Icon(Icons.festival),
                title: Text("SEGUNDA NOTICIA"),
                subtitle: Text("SUBTITULO SEGUNDA NOTICIA"),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text("LEER MAS..."),
                      onPressed: (){},
                    ),

                  ]
              ),
              Divider(),
              const ListTile(
                leading: Icon(Icons.festival),
                title: Text("TERCERA NOTICIA"),
                subtitle: Text("SUBTITULO TERCERA NOTICIA"),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text("LEER MAS..."),
                      onPressed: (){},
                    ),

                  ]
              ),
              Divider(),
              const ListTile(
                leading: Icon(Icons.festival),
                title: Text("CUARTA NOTICIA"),
                subtitle: Text("CUARTA TERCERA NOTICIA"),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text("LEER MAS..."),
                      onPressed: (){},
                    ),

                  ]
              ),
              Divider(),
              const ListTile(
                leading: Icon(Icons.festival),
                title: Text("QUINTA NOTICIA"),
                subtitle: Text("SUBTITULO QUINTA NOTICIA"),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text("LEER MAS..."),
                      onPressed: (){},
                    ),

                  ]
              ),


            ]
          )
        ),

      ),

      bottomNavigationBar: Footer(),
    );
  }
}
