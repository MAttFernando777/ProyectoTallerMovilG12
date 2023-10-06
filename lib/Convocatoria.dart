import 'package:flutter/material.dart';
import 'package:proyecto_g12/Footer.dart';
import 'package:proyecto_g12/MenuLateral.dart';

class Job {
  final String logo;
  final String company;
  final String position;
  final String salary;
  final String location;
  final String date;
  final String url;

  Job({
    required this.logo,
    required this.company,
    required this.position,
    required this.salary,
    required this.location,
    required this.date,
    required this.url,
  });
}

final List<Job> jobs = [
  Job(
      logo:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/c9/2b/ff/c92bff76-b51a-5ee6-e461-a3fe037e12fd/AppIcon-0-1x_U007emarketing-85-220-5.png/256x256bb.jpg',
      company: 'Sunat',
      position: 'Ingeniero de Software',
      salary: 'S/1,500 soles',
      location: 'Lima',
      date: 'Vigente hasta el 19/09/2023',
      url: 'www.sunat.com.pe/convocatoria/1'),
  Job(
      logo:
          'data:image/png;base64,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',
      company: 'Universidad Federico Villareal',
      position: 'Analista de datos',
      salary: 'S/2,000 soles',
      location: 'Lima',
      date: 'Vigente hasta el 25/10/2023',
      url: 'www.unfv.com.pe/convocatoria/1'),
  Job(
      logo:
          'data:image/png;base64,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',
      company: 'MINEDU',
      position: 'Soporte de TI',
      salary: 'S/2,500 soles',
      location: 'Lima',
      date: 'Vigente hasta el 31/10/2023',
      url: 'www.minedu.com/convocatoria/1'),
];

class Convocatoria extends StatelessWidget {
  const Convocatoria({super.key});

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
              itemCount: jobs.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(jobs[index].logo),
                    title: Text(jobs[index].company),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(jobs[index].position),
                        Row(
                          children: [
                            const Icon(Icons.attach_money),
                            Text(jobs[index].salary),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            Text(jobs[index].location),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today),
                            Text(jobs[index].date),
                          ],
                        ),
                      ],
                    ),
                    trailing: ElevatedButton(
                      child: const Text('Ver convocatoria'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ElementoConvocatoria(job: jobs[index])));
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
  final Job job;

  const ElementoConvocatoria({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              job.logo,
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
                        Text(job.company,
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
                        Text(job.position,
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
                        Text(job.location,
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
                        Text(job.salary,
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
                          child: Text(job.url,
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
