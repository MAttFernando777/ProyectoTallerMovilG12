import 'package:flutter/material.dart';
import 'package:proyecto_g12/Footer.dart';
import 'MenuLateral.dart';
import 'SecTram.dart';

class Tramites extends StatelessWidget {
  const Tramites({Key? key}) : super(key: key);

  Container _buildTramiteCard(
      Widget leading, String title, String subtitle, VoidCallback onPressed) {
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
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: leading,
              title: Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
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
                    child: const Text("Seguir leyendo"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(title: const Text("TRAMITES")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildTramiteCard(
                const Icon(Icons.document_scanner),
                "ANULACIÓN DE MATRICULA:",
                "Anulación de Matrícula Semestre Académico 2023–II",
                () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SecTram();
                    },
                  );
                },
              ),
              _buildTramiteCard(
                const Icon(Icons.document_scanner),
                "CARNÉ UNIVERSITARIO",
                "Trámite de Carné Universitario 2023 - Rezagados",
                () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SecTram();
                    },
                  );
                },
              ),
              _buildTramiteCard(
                const Icon(Icons.document_scanner),
                "TRAMITE DE BACHILLER",
                "Requisitos para tramitar el Grado Académico de Bachiller",
                () {},
              ),
              _buildTramiteCard(
                const Icon(Icons.document_scanner),
                "TRAMITE DE TITULO PROFESIONAL",
                "Requisitos para tramitar el Título Profesional",
                () {},
              ),
              _buildTramiteCard(
                const Icon(Icons.document_scanner),
                "RECTIFICACION DE MATRICULA",
                "Requisitos para la salida o ingreso de cursos",
                () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
