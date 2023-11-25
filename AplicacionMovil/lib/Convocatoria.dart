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

  Container _buildConvocatoriaCard(IConvocatoria convocatoria) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        child: ListTile(
          leading: Image.network(convocatoria.logo),
          title: Text(convocatoria.empresa),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(convocatoria.puesto),
              Row(
                children: [
                  const Icon(Icons.attach_money),
                  Text('S/ ${convocatoria.salario} nuevos soles'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  Text(convocatoria.lugar),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_today),
                  Text(convocatoria.fecha.toString()),
                ],
              ),
            ],
          ),
          trailing: ElevatedButton(
            child: const Text('Ver más'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ElementoConvocatoria(convocatoria: convocatoria)));
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(title: Text("CONVOCATORIAS")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: convocatorias.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildConvocatoriaCard(convocatorias[index]);
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
