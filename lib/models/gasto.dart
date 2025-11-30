import 'package:json_annotation/json_annotation.dart';

part 'gasto.g.dart';

@JsonSerializable()
class Gasto {
  final String id;
  final String titulo;
  final double monto;
  final DateTime fecha;

  Gasto({
    required this.id,
    required this.titulo,
    required this.monto,
    required this.fecha,
  });

  // Métodos para json_serializable
  factory Gasto.fromJson(Map<String, dynamic> json) => _$GastoFromJson(json);
  Map<String, dynamic> toJson() => _$GastoToJson(this);
}
