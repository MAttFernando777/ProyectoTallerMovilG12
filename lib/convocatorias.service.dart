import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_g12/Convocatoria.modelo.dart';

class ConvocatoriaService {
  final String baseUrl;

  ConvocatoriaService({required this.baseUrl});

  Future<List<IConvocatoria>> getAllConvocatorias() async {
    final response = await http.get(Uri.parse('$baseUrl/convocatorias'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<IConvocatoria> convocatorias =
          data.map((item) => IConvocatoria.fromJson(item)).toList();
      return convocatorias;
    } else {
      throw Exception('Error al cargar convocatorias');
    }
  }

  Future<List<IConvocatoria>> getConvocatoriaById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/convocatorias/$id'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<IConvocatoria> convocatoria =
          data.map((item) => IConvocatoria.fromJson(item)).toList();
      return convocatoria;
    } else {
      throw Exception('Error al cargar convocatoria');
    }
  }
}
