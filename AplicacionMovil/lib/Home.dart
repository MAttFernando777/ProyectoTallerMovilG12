import 'package:flutter/material.dart';
import 'package:proyecto_g12/Conferencias.dart';
import 'package:proyecto_g12/Convocatoria.dart';
import 'package:proyecto_g12/Footer.dart';
import 'package:proyecto_g12/Lector.dart';
import 'package:proyecto_g12/MenuLateral.dart';
import 'package:proyecto_g12/Noticia.dart';
import 'package:proyecto_g12/Tramites.dart';
import 'package:proyecto_g12/convocatorias.service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("INICIO"),
      ),
      drawer: MenuLateral(),
      body: Container(
        color: Colors.white,
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: constraints.maxHeight / 3,
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/4/46/UNMSM_Facultad_de_Ingenier%C3%ADa_de_Sistemas_e_Inform%C3%A1tica_2019_-_Vista_lateral.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildOptionCard(
                            'Noticias',
                            Icons.newspaper,
                            () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Noticia(),
                                ),
                              );
                            },
                          ),
                          _buildOptionCard(
                            'Trámites',
                            Icons.assignment,
                            () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const Tramites(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildOptionCard(
                            'Conferencias',
                            Icons.mic,
                            () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Conferencias(),
                                ),
                              );
                            },
                          ),
                          _buildOptionCard(
                            'Convocatorias',
                            Icons.notifications,
                            () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Convocatoria(
                                    convocatoriaService: ConvocatoriaService(
                                      baseUrl: 'http://192.168.1.75:3000',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Lector(),
            ),
          );
        },
        child: const Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      bottomNavigationBar: Footer(),
    );
  }

  Widget _buildOptionCard(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Color(0xFF621518),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
