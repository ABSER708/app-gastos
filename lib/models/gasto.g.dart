// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gasto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gasto _$GastoFromJson(Map<String, dynamic> json) => Gasto(
  titulo: json['titulo'] as String,
  monto: (json['monto'] as num).toDouble(),
  fecha: DateTime.parse(json['fecha'] as String), id: '',
);

Map<String, dynamic> _$GastoToJson(Gasto instance) => <String, dynamic>{
  'titulo': instance.titulo,
  'monto': instance.monto,
  'fecha': instance.fecha.toIso8601String(),
};
