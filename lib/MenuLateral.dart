import 'package:proyecto_g12/Conferencias.dart';
import 'package:proyecto_g12/convocatorias.service.dart';
import 'package:proyecto_g12/main.dart';
import 'package:flutter/material.dart';
import 'Busqueda.dart';
import 'Desconectar.dart';
import 'Convocatoria.dart';
import 'Noticia.dart';
import 'Tramites.dart';

class MenuLateral extends StatelessWidget {
  @override
  bool isSelected = false;

  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("FisiApp"),
            accountEmail: Text("rodrigo.prado@unmsm.edu.pe"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/4/46/UNMSM_Facultad_de_Ingenier%C3%ADa_de_Sistemas_e_Inform%C3%A1tica_2019_-_Vista_lateral.jpg"),
                    fit: BoxFit.cover)),
          ),
          Ink(
            color: Colors.red,
            child: new ListTile(
              title: Text(
                "INICIO",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyApp()));
              },
            ),
          ),
          ListTile(
            tileColor: isSelected ? Colors.blue : null,
            title: Text('NOTICIAS'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Noticia()));
            },
          ),
          new ListTile(
            title: Text("TRAMITES"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Tramites()));
            },
          ),
          /* new ListTile(
            title: Text("BUSQUEDA"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Busqueda()));
            },
          ), */
          new ListTile(
            title: Text("CONFERENCIAS"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Conferencias()));
            },
          ),
          new ListTile(
            title: Text("CONVOCATORIAS"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Convocatoria(
                        convocatoriaService: ConvocatoriaService(
                            baseUrl: 'http://192.168.1.75:3000'),
                      )));
            },
          ),
          new ListTile(
            title: Text("Salir"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Desconectar()));
            },
          ),
        ],
      ),
    );
  }
}
