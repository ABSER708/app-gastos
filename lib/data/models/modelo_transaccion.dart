import '../../domain/entities/transaccion.dart';

class TransaccionModel {
  final String id;
  final String descripcion;
  final double monto;
  final DateTime fecha;
  final String categoria;
  final bool esGasto;

  TransaccionModel({
    required this.id,
    required this.descripcion,
    required this.monto,
    required this.fecha,
    required this.categoria,
    required this.esGasto,
  });

  // Convertir de entidad a modelo
  factory TransaccionModel.fromEntity(Transaccion t) => TransaccionModel(
        id: t.id,
        descripcion: t.descripcion,
        monto: t.monto,
        fecha: t.fecha,
        categoria: t.categoria,
        esGasto: t.esGasto,
      );

  // Convertir de modelo a entidad
  Transaccion toEntity() => Transaccion(
        id: id,
        descripcion: descripcion,
        monto: monto,
        fecha: fecha,
        categoria: categoria,
        esGasto: esGasto,
      );

  // Métodos de persistencia ejemplo
  static Future<List<TransaccionModel>> getAll() async {
    // aquí va la consulta a Drift/Hive
    return [];
  }

  Future<void> save() async {
    // guardar en base de datos local
  }
}