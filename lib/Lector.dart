import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:proyecto_g12/Elemento.dart';

import 'Convocatoria_backup.dart';

class Lector extends StatefulWidget {
  @override
  _LectorState createState() => _LectorState();

}
class _LectorState extends  State<Lector> {
  ScanResult? _scanResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lector códigos QR'),
      ),
      body: Center(
          child: _scanResult == null ?
          Text('Esperando datos de código') : Column(
            children: [
              Text('Contenido: ${_scanResult?.rawContent}'),
              Text('Formato: ${_scanResult?.format.toString()}'),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scanCode();
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<void> _scanCode() async {
    var result = await BarcodeScanner.scan();
    if (result.type == ResultType.Barcode) {
      // Revisar el contenido del QR
      String qrContent = result.rawContent;
    //AQUI SE VAN A LAS PÁGUINAS DEPENDIENDO DEL QR
      if (qrContent == 'Noticia') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Noticia()));
      } else if (qrContent == 'Elemento') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Elemento()));
      } else {
        // Handle other cases or show an error message.
      }
      setState(() {
        _scanResult = result;
      });
    }
  }
}