import 'package:proyecto_g12/Conferencias.dart';
import 'package:proyecto_g12/main.dart';
import 'package:flutter/material.dart';
import 'Busqueda.dart';
import 'Desconectar.dart';
import 'Convocatoria.dart';
import 'Noticia.dart';
import 'Eventos.dart';

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
                        "https://www.infobae.com/new-resizer/OOLgk9RU2ybtn6VR_PNxV77TRMM=/arc-anglerfish-arc2-prod-infobae/public/XXF447NCCFDXFACDQI5Q7NQGM4.png"),
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
            title: Text("EVENTOS"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Eventos()));
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
                  builder: (BuildContext context) => Convocatoria()));
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
