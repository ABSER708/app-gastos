class Transaccion {
final String id;
final String descripcion;
final double monto;
final DateTime fecha;
final String categoria;
final bool esGasto;


Transaccion({
required this.id,
required this.descripcion,
required this.monto,
required this.fecha,
required this.categoria,
required this.esGasto,
});
}