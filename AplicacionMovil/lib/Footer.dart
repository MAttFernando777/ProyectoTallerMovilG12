import 'package:flutter/material.dart';
import 'package:proyecto_g12/Home.dart';
import 'package:proyecto_g12/main.dart';
import 'package:proyecto_g12/chat.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      onTap: (int index) {
        if (index == 1) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        }
        if (index == 0) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => Chat()));
        }
      },
    );
  }
}
