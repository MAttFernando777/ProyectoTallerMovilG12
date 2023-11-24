import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({Key? key, this.child}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget.child!),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF621518), // Fondo de color rojo
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/UNMSM_escudo_XVI-XXI_transparente_siglas_nombre_vertical.svg/1200px-UNMSM_escudo_XVI-XXI_transparente_siglas_nombre_vertical.svg.png', // Reemplaza con la URL de tu imagen
                width: 255, // Ajusta el ancho según tus necesidades
                height: 300, // Ajusta el alto según tus necesidades
              ),
            ],
          ),
        ),
      ),
    );
  }
}
