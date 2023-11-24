import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_g12/Home.dart';
import 'package:proyecto_g12/login_page.dart';
import 'package:proyecto_g12/sign_up_page.dart';
import 'package:proyecto_g12/splash_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: createMaterialColor(Color(0xFF812f32)),
        ),
        routes: {
          '/': (context) => SplashScreen(child: const LoginPage()),
          '/login': (context) => const LoginPage(),
          '/signUp': (context) => SignUpPage(),
          '/home': (context) => const HomePage(),
        });
  }

  MaterialColor createMaterialColor(Color color) {
    List<int> strengths = <int>[
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900
    ];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int strength in strengths) {
      swatch[strength] = Color.fromRGBO(r, g, b, 1);
    }

    return MaterialColor(color.value, swatch);
  }
}
