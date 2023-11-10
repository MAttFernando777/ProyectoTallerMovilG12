import 'package:flutter/material.dart';
import 'MenuLateral.dart';

class Elemento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(),
      body: Center(
        child: Text("ELEMENTO CUALQUIERA"),
      ),
    );
  }
}