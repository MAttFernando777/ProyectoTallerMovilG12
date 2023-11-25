import 'package:flutter/material.dart';
import 'package:proyecto_g12/Footer.dart';
import 'MenuLateral.dart';
import 'Elemento.dart';

class Conferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(title: Text("CONFERENCIAS")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildConferenciaCard(
                "PRIMERA CONFERENCIA",
                "CONFERENCIA PRIMERA NOTICIA",
                () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Elemento(),
                  ));
                },
              ),
              _buildConferenciaCard(
                "SEGUNDA CONFERENCIA",
                "SUBTITULO SEGUNDA CONFERENCIA",
                () {},
              ),
              _buildConferenciaCard(
                "TERCERA NOTICIA",
                "SUBTITULO TERCERA CONFERENCIA",
                () {},
              ),
              _buildConferenciaCard(
                "CUARTA CONFERENCIA",
                "CUARTA TERCERA CONFERENCIA",
                () {},
              ),
              _buildConferenciaCard(
                "QUINTA CONFERENCIA",
                "SUBTITULO QUINTA CONFERENCIA",
                () {},
              ),
              _buildConferenciaCard(
                "SEXTA CONFERENCIA",
                "SUBTITULO SEXTA CONFERENCIA",
                () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }

  Container _buildConferenciaCard(
      String title, String subtitle, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.festival),
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
