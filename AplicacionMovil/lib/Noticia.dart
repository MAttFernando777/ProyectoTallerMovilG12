import 'package:flutter/material.dart';
import 'package:proyecto_g12/Footer.dart';
import 'MenuLateral.dart';
import 'Elemento.dart';

class Noticia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(title: const Text("NOTICIAS")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildNoticiaCard(
                "Entrega de carné universitario",
                "Periodo académico 2023-II",
                () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Elemento(),
                  ));
                },
              ),
              _buildNoticiaCard(
                "Convocatoria equipo de futbol",
                "Facultad de Ingenieria de Sistemas",
                () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Elemento(),
                  ));
                },
              ),
              _buildNoticiaCard(
                "Fumigación del comedor",
                "Entrada al comedor sin ticket",
                () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Elemento(),
                  ));
                },
              ),
              _buildNoticiaCard(
                "Primer puesto en hackaton",
                "'Searching for dreams' gana primer puesto",
                () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Elemento(),
                  ));
                },
              ),
              _buildNoticiaCard(
                "Casos de covid19 en ciudad",
                "MINSA anuncia medidas de seguridad",
                () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Elemento(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }

  Container _buildNoticiaCard(
      String title, String subtitle, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.festival),
              title: Text(title),
              subtitle: Text(subtitle),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(8),
                      backgroundColor: const Color(0xFF621518),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: onPressed,
                    child: const Text("Leer más"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
