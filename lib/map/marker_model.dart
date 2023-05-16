import 'package:json_path/json_path.dart';

class MarkerBuilder {
  final String latLng;
  final String parkImage;
  final String nombre;
  final String desc;
  final String horario;

  MarkerBuilder(
      {required this.latLng,
      required this.parkImage,
      required this.nombre,
      required this.desc,
      required this.horario});

  factory MarkerBuilder.fromJson(Map<String, dynamic> json) {
    final latLng = JsonPath(r'''$[0].UBICACION.LatLng''').toString();
    final parkImage = json['packImage'];
    final nombre = json['nombre'];
    final desc = json['desc'];
    final horario = json['horario'];

    return MarkerBuilder(
        latLng: latLng,
        parkImage: parkImage,
        nombre: nombre,
        desc: desc,
        horario: horario);
  }
}
