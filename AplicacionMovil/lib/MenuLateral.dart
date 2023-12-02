import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_g12/Conferencias.dart';
import 'package:proyecto_g12/Home.dart';
import 'package:proyecto_g12/convocatorias.service.dart';
import 'package:proyecto_g12/main.dart';
import 'package:flutter/material.dart';
import 'Convocatoria.dart';
import 'Noticia.dart';
import 'Tramites.dart';

class MenuLateral extends StatelessWidget {
  @override
  bool isSelected = false;

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("FisiApp"),
            accountEmail: Text("rodrigo.prado@unmsm.edu.pe"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/4/46/UNMSM_Facultad_de_Ingenier%C3%ADa_de_Sistemas_e_Inform%C3%A1tica_2019_-_Vista_lateral.jpg"),
                    fit: BoxFit.cover)),
          ),
          Ink(
            color: Color(0xFF621518),
            child: ListTile(
              title: const Text(
                "INICIO",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
              },
            ),
          ),
          ListTile(
            tileColor: isSelected ? Colors.blue : null,
            title: const Text('NOTICIAS'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Noticia()));
            },
          ),
          ListTile(
            title: const Text("TRAMITES"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Tramites()));
            },
          ),
          ListTile(
            title: const Text("CONFERENCIAS"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Conferencias()));
            },
          ),
          ListTile(
            title: const Text("CONVOCATORIAS"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Convocatoria(
                        convocatoriaService: ConvocatoriaService(
                            baseUrl: 'https://app-api-hxbx.onrender.com'),
                      )));
            },
          ),
          ListTile(
            title: const Text("Salir"),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
