import 'package:flutter/material.dart';
import 'package:proyecto_g12/Conferencias.dart';
import 'package:proyecto_g12/Busqueda.dart';
import 'package:proyecto_g12/Convocatoria.dart';
import 'package:proyecto_g12/Tramites.dart';
import 'package:proyecto_g12/Footer.dart';
import 'package:proyecto_g12/Noticia.dart';
import 'package:proyecto_g12/convocatorias.service.dart';
import 'MenuLateral.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("INICIO"),
        ),
        drawer: MenuLateral(),
        body: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: constraints.maxHeight / 3,
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/4/46/UNMSM_Facultad_de_Ingenier%C3%ADa_de_Sistemas_e_Inform%C3%A1tica_2019_-_Vista_lateral.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Noticia()));
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: Center(child: Text('Noticias')),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Tramites()));
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: Center(child: Text('Tramites')),
                      ),
                    ),
                    /* GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Busqueda()));
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: Center(child: Text('Busqueda')),
                      ),
                    ), */
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Conferencias()));
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: Center(child: Text('Conferencias')),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Convocatoria(
                                  convocatoriaService: ConvocatoriaService(
                                      baseUrl: 'http://192.168.1.75:3000'),
                                )));
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: Center(child: Text('Convocatorias')),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
