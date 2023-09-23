import 'package:flutter/material.dart';
import 'package:proyecto_g12/Footer.dart';
import 'MenuLateral.dart';

class Eventos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(),
      body: Center(
        child: Text("ESTÁS EN EVENTOS"),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
