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

  factory Gasto.fromJson(Map<String, dynamic> json) => _$GastoFromJson(json);
  Map<String, dynamic> toJson() => _$GastoToJson(this);

  Gasto copyWith({
    String? id,
    String? titulo,
    double? monto,
    DateTime? fecha,
  }) {
    return Gasto(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      monto: monto ?? this.monto,
      fecha: fecha ?? this.fecha,
    );
  }
}
