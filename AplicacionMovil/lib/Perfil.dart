import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  final String userEmail;

  Perfil({required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil de Usuario"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              "Usuario: $userEmail",
              style: const TextStyle(fontSize: 20),
            ),
            // Puedes agregar más detalles del perfil aquí
          ],
        ),
      ),
    );
  }
}
