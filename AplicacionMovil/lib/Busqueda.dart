import 'package:flutter/material.dart';
import 'package:proyecto_g12/Footer.dart';
import 'MenuLateral.dart';
import 'package:flutter/cupertino.dart';

class Busqueda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(),
      body: Center(
        child: Text("ESTÁS EN BUSQUEDA"),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
