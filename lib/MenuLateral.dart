import 'package:proyecto_g12/main.dart';
import 'package:flutter/material.dart';
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
                        "https://e.rpp-noticias.io/large/2016/01/07/024802_58863.jpg"),
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
