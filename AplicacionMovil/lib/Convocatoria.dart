import 'package:flutter/material.dart';
import 'package:proyecto_g12/Footer.dart';
import 'package:proyecto_g12/MenuLateral.dart';
import 'package:proyecto_g12/Convocatoria.modelo.dart';
import 'package:proyecto_g12/convocatorias.service.dart';

class Convocatoria extends StatefulWidget {
  final ConvocatoriaService convocatoriaService;

  Convocatoria({required this.convocatoriaService});

  @override
  _ConvocatoriaState createState() => _ConvocatoriaState();
}

class _ConvocatoriaState extends State<Convocatoria> {
  List<IConvocatoria> convocatorias = [];

  @override
  void initState() {
    super.initState();
    _fetchConvocatorias();
  }

  Future<void> _fetchConvocatorias() async {
    try {
      List<IConvocatoria> fetchedConvocatorias =
          await widget.convocatoriaService.getAllConvocatorias();
      setState(() {
        convocatorias = fetchedConvocatorias;
      });
    } catch (e) {
      print('Error al cargar convocatorias: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(title: Text("CONVOCATORIAS")),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 150,
              height: 100,
              padding: const EdgeInsets.all(10.0),
              color: Colors.red,
              child: const Center(child: Text('Convocatorias')),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: convocatorias.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(convocatorias[index].logo),
                    title: Text(convocatorias[index].empresa),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(convocatorias[index].puesto),
                        Row(
                          children: [
                            const Icon(Icons.attach_money),
                            Text(
                                'S/ ${convocatorias[index].salario} nuevos soles'),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            Text(convocatorias[index].lugar),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today),
                            Text(convocatorias[index].fecha.toString()),
                          ],
                        ),
                      ],
                    ),
                    trailing: ElevatedButton(
                      child: const Text('Ver convocatoria'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ElementoConvocatoria(
                                    convocatoria: convocatorias[index])));
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class ElementoConvocatoria extends StatelessWidget {
  final IConvocatoria convocatoria;
  const ElementoConvocatoria({super.key, required this.convocatoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              convocatoria.logo,
              width: 150.0,
              height: 150.0,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                ),
                Icon(Icons.assignment_turned_in_outlined),
                SizedBox(width: 8.0),
                Text('RESUMEN DE CONVOCATORIA',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16.0),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Text('Institución:',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 4.0),
                        Text(convocatoria.empresa,
                            style: const TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Text('Puesto para:',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 4.0),
                        Text(convocatoria.puesto,
                            style: const TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Text('Lugar:',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 4.0),
                        Text(convocatoria.lugar,
                            style: const TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Text('Remuneración:',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 4.0),
                        Text(
                            'S/ ' +
                                convocatoria.salario.toString() +
                                ' nuevos soles',
                            style: const TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(children: [
                      const Icon(
                        Icons.link,
                        size: 16.0,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      const Text('Detalles:',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 4.0),
                      Expanded(
                          child: Text(convocatoria.url,
                              style: const TextStyle(fontSize: 16.0))),
                    ])
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
