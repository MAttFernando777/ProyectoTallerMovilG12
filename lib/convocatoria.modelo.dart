class IConvocatoria {
  final int id;
  final String logo;
  final String empresa;
  final String puesto;
  final double salario;
  final String lugar;
  final String fecha;
  final String url;

  IConvocatoria({
    required this.id,
    required this.logo,
    required this.empresa,
    required this.puesto,
    required this.salario,
    required this.lugar,
    required this.fecha,
    required this.url,
  });

  factory IConvocatoria.fromJson(Map<String, dynamic> json) {
    return IConvocatoria(
      id: json['id'] as int,
      logo: json['logo'] as String,
      empresa: json['empresa'] as String,
      puesto: json['puesto'] as String,
      salario: json['salario'] as double,
      lugar: json['lugar'] as String,
      fecha: json['fecha'] as String,
      url: json['url'] as String,
    );
  }
}
